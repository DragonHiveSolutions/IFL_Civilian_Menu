Citizen.CreateThread(function()

    --[[ Main and Submenu Declarations ]]--
    WarMenu.CreateMenu('civ', 'Civilian Menu')
    WarMenu.SetTitleBackgroundColor('civ', 175, 17, 207, 255) -- Set header to purple
    WarMenu.SetSubTitle('civ', 'Made by Infinity Studios')

    -- Props
    WarMenu.CreateSubMenu('props', 'civ', 'Props')
	WarMenu.SetTitleBackgroundColor('props', 175, 17, 207, 255) -- Set header to purple
	WarMenu.CreateSubMenu('spawning', 'props', 'Spawning')
	WarMenu.SetTitleBackgroundColor('props', 175, 17, 207, 255) -- Set header to purple
	WarMenu.CreateSubMenu('manipulate', 'props', 'Manipulation')
	WarMenu.SetTitleBackgroundColor('props', 175, 17, 207, 255) -- Set header to purple
	WarMenu.CreateSubMenu('attaching', 'props', 'Attaching')
    WarMenu.SetTitleBackgroundColor('props', 175, 17, 207, 255) -- Set header to purple
    
    -- Observations
	WarMenu.CreateSubMenu('obs', 'civ', 'Observations')
    WarMenu.SetTitleBackgroundColor('obs', 175, 17, 207, 255) -- Set header to purple
    
    -- SEARCHING
	WarMenu.CreateSubMenu('search', 'civ', 'Searching')
    WarMenu.SetTitleBackgroundColor('search', 175, 17, 207, 255) -- Set header to purple
    WarMenu.CreateSubMenu('searchitemsv', 'civ', 'Veh Items')
	WarMenu.SetTitleBackgroundColor('searchitemsv', 175, 17, 207, 255) -- Set header to purple
	WarMenu.CreateSubMenu('searchitemsp', 'civ', 'Pers. Items')
	WarMenu.SetTitleBackgroundColor('searchitemsp', 175, 17, 207, 255) -- Set header to purple
    

    while true do
        --[[ LOOP ]]--
        
        if IsControlJustReleased(0, Config.MainActivationKey) and GetLastInputMethod( 0 ) then -- OPEN MAIN MENU
			WarMenu.OpenMenu('civ')
        end
        
        if WarMenu.IsMenuOpened('civ') then -- Main menu processing
            if WarMenu.MenuButton('Props', 'props') then
            elseif WarMenu.MenuButton('Observations', 'obs') then
            elseif WarMenu.MenuButton('Searching', 'search') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('search') then
			searchciv()
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('props') then
			props()
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('spawning') then
			spawning()
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('manipulate') then
			manipulate()
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('attaching') then
			attaching()
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('obs') then
			obs()
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('searchitemsv') then
			itemsv()
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('searchitemsp') then
			itemsp()
			WarMenu.Display()
		end

        Citizen.Wait(0)
    end

end)