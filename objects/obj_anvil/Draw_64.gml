if (opened == false)
{
	exit;	
}
else
{
	var gui_cords = world_to_gui(x,y);
	var xx = gui_cords[0];
	var yy = gui_cords[1];
	
	var mouse_gui_cords = world_to_gui(mouse_x,mouse_y);
	var mousex = mouse_gui_cords[0];
	var mousey = mouse_gui_cords[1];
	
	draw_sprite_ext(spr_inventory, 0, xx, yy, 1, 3, 0, c_white, 1);	
	
	if (mouse_wheel_up())
	{
		if (sight > 0)
		{
			sight--;	
		}
	}
	
	if (mouse_wheel_down())
	{
		if (sight < ANVIL_CRAFTS - CRAFTING_SPACE)
		{
			sight++;	
		}
	}
	
	for (var i = 0; i < CRAFTING_SPACE; i++)
	{
		var ypos = yy + i*item_height;
		draw_sprite_ext(spr_all_items, crafts[i + sight], xx, ypos, 1, 1, 0, c_white, 1);
		if (point_in_rectangle(mousex, mousey, xx, ypos, xx + 32, ypos + 32))
		{
			selected = i;
			if (obj_input.attack)
			{
				if (has_enough_items(obj_crafting.recipe_list[selected + sight]) == true)
				{
					inv_add(obj_inventory, crafts[selected + sight]);	
					for (var c = 0; c < NUMBER_OF_UNIQUE_ITEMS; c++)
					{
						if (obj_crafting.recipe_list[selected + sight][# c,0] > 0)
						{
							inv_remove(obj_inventory, c, obj_crafting.recipe_list[selected + sight][# c,0]);
						}
					}
				}
			}
		}
	
	}
}