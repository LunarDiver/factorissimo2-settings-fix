local update_hidden_techs = function(force)
    if settings.global['Factorissimo2-hide-recursion'] and settings.global['Factorissimo2-hide-recursion'].value then
        force.technologies['factory-recursion-t1'].enabled = false
        force.technologies['factory-recursion-t2'].enabled = false
    elseif settings.global['Factorissimo2-hide-recursion-2'] and settings.global['Factorissimo2-hide-recursion-2'].value then
        force.technologies['factory-recursion-t1'].enabled = true
        force.technologies['factory-recursion-t2'].enabled = false
    else
        force.technologies['factory-recursion-t1'].enabled = true
        force.technologies['factory-recursion-t2'].enabled = true
    end
end

script.on_init(function()
    for _, force in pairs(game.forces) do
        update_hidden_techs(force)
    end
end)
script.on_event(defines.events.on_research_finished, function()
    for _, force in pairs(game.forces) do
        update_hidden_techs(force)
    end
end)
