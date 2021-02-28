function ulx.godacf( calling_ply, target_plys, should_revoke )
    if not target_plys[ 1 ]:IsValid() then
        if not should_revoke then
            Msg( "You are the console, you are already god.\n" )
        else
            Msg( "Your position of god is irrevocable; if you don't like it, leave the matrix.\n" )
        end
        return
    end

    local affected_plys = {}
    for i=1, #target_plys do
        local v = target_plys[ i ]

        if ulx.getExclusive( v, calling_ply ) then
            ULib.tsayError( calling_ply, ulx.getExclusive( v, calling_ply ), true )
        else
            if not should_revoke then
                v.ACFGod = true
            else
                v.ACFGod = nil
            end
            table.insert( affected_plys, v )
        end
    end

    if not should_revoke then
        ulx.fancyLogAdmin( calling_ply, "#A granted acf god mode upon #T", affected_plys )
    else
        ulx.fancyLogAdmin( calling_ply, "#A revoked acf god mode from #T", affected_plys )
    end
end

local godacf = ulx.command( "Fun", "ulx godacf", ulx.godacf, { "!godacf", "!acfgod" } )
godacf:addParam{ type=ULib.cmds.PlayersArg, ULib.cmds.optional }
godacf:addParam{ type=ULib.cmds.BoolArg, invisible=true }
godacf:defaultAccess( ULib.ACCESS_ADMIN )
godacf:help( "Grants acf god mode to target(s)." )
godacf:setOpposite( "ulx ungodacf", {_, _, true}, { "!ungodacf", "!acfungod", "!unacfgod" } )
