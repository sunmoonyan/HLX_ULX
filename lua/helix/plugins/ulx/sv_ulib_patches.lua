if SERVER then 

    function ULib.clientRPC( plys, fn, ... )
        -- Normalisation des joueurs
        if plys ~= nil then
            if IsValid(plys) and plys:IsPlayer() then
                plys = { plys } -- Player → table
            elseif not istable(plys) then
                return ULib.throwBadArg(1, "ULib.clientRPC", "nil,Player,table", plys)
            end
        end

        ULib.checkArg(2, "ULib.clientRPC", {"string"}, fn)

        net.Start("URPC")
            net.WriteString(fn)
            net.WriteTable({...})
        if plys then
            net.Send(plys)
        else
            net.Broadcast()
        end
    end

    local function plyToTable(plys)
        -- nil → tous les joueurs
        if plys == nil then
            return player.GetAll()
        end

        -- Player unique → table
        if IsValid(plys) and plys:IsPlayer() then
            return { plys }
        end

        -- Table vide → tous les joueurs
        if istable(plys) then
            if #plys == 0 then
                return player.GetAll()
            end
            return plys
        end

        error("plyToTable: invalid argument (expected nil, Player, or table)")
    end


    function xgui.sendDataTable( plys, datatypes, forceSend )
        if type( datatypes ) ~= "table" then
            datatypes = { datatypes }
        elseif #datatypes == 0 then
            for _, k in ipairs( xgui.dataTypes ) do
                table.insert( datatypes, k.name )
            end
        end

        plys = plyToTable( plys )

        for k, ply in pairs( plys ) do
            if not xgui.readyPlayers[ply:UniqueID()] then return end --Ignore requests to players who are not ready, they'll get the data as soon as they can.

            if xgui.activeUsers[ply:UniqueID()] and not forceSend then --If data is currently being sent to the client
                for _, dtype in ipairs( datatypes ) do
                    local exists = false
                    for _,existingArg in ipairs(xgui.activeUsers[ply:UniqueID()].tables) do
                        if dtype == existingArg then exists=true break end
                    end
                    if not exists then table.insert( xgui.activeUsers[ply:UniqueID()].tables, dtype ) end
                    --Clear any events relating to this data type, since those changes will be reflected whenever the new table is sent.
                    for i=#xgui.activeUsers[ply:UniqueID()].events,1,-1 do
                        if xgui.activeUsers[ply:UniqueID()].events[i][2] == dtype then
                            table.remove( xgui.activeUsers[ply:UniqueID()].events, i )
                        end
                    end
                end
                return
            end

            local chunks = {}
            for _, dtype in ipairs( datatypes ) do
                if xgui.dataTypes[dtype] then
                    local data = xgui.dataTypes[dtype]
                    if ULib.ucl.query( ply, data.access ) then
                        local t = data.getData()
                        local size = data.maxchunk or 0 --Split the table into "chunks" of per-datatype specified size to even out data flow. 0 to disable
                        if t and table.Count( t ) > size and size ~= 0 then
                            table.insert( chunks, { 5, dtype } ) --Signify beginning of split chunks
                            local c = 1
                            local part = {}
                            for key, data in pairs( t ) do
                                part[key] = data
                                c = c + 1
                                if c > size then
                                    table.insert( chunks, { 1, dtype, part } )
                                    part = {}
                                    c = 1
                                end
                            end
                            table.insert( chunks, { 1, dtype, part } )
                            table.insert( chunks, { 6, dtype } ) --Signify end of split chunks
                        else
                            table.insert( chunks, { 1, dtype, data.getData() } )
                        end
                    else
                        table.insert( chunks, { 0, dtype } )
                    end
                end
            end

            if #chunks ~= 0 then
                xgui.sendChunks( ply, chunks )
            else
                xgui.chunksFinished( ply )
            end
        end
    end

    function xgui.sendDataEvent( plys, evtype, dtype, entry )
        plys = plyToTable( plys )
        for k, ply in pairs( plys ) do

            if xgui.activeUsers[ply:UniqueID()] then
                table.insert( xgui.activeUsers[ply:UniqueID()].events, { evtype, dtype, entry } )
                return
            end

            local chunks = {}
            table.insert( chunks, { evtype, dtype, entry } )
            xgui.sendChunks( ply, chunks )
        end
    end

end
