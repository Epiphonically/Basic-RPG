
if (obj_player.openinventory == false)
{
	for (var i = 0; i < INV_SPACE - 1; i++)
	{
		if (stack[i] == 0)
		{
			inventory[i] = -1;	
		}
		if (inventory[i] != -1)
		{
			if (inventory[i] >= obj_mouse.weapon_start && inventory[i] <= obj_mouse.leg_end)
			{
				max_stack[i] = 1;	
			}
			else
			{
				max_stack[i] = 20;	
			}
		}
		else 
		{
			max_stack[i] = 1;
			stack[i] = 0;
		}
	}
	
	exit;
}
else
{
	draw_sprite_stretched(
	spr_inventory, 
	0, 
	defaultx-margin, 
	defaulty-margin,
	margin*2 + inventory_width * slot_width, //num of slots * how wide each slot is
	margin*2 + (((INV_SPACE-1) div inventory_width) + 1)*slot_width //invspace over the width gets you how many rows times 36 which is height of each row
	);
	for (var i = 0; i < INV_SPACE; i++)
	{
		if (stack[i] == 0)
		{
			inventory[i] = -1;	
		}
		var xx = defaultx + (i % inventory_width) * slot_width + 2; //remainder of i and inventory width returns how many more slots to draw
		var yy = defaulty + (i div inventory_width) * slot_width + 2; //tells us which row we should be on 10 drawn/5 per row = second row
		var hover = (obj_mouse.inv_hover == id) && (obj_mouse.slot_hover == i);
		draw_sprite(spr_inventory_slot, hover, xx, yy);
		
		if (inventory[i] != -1)
		{
			var alpha = 1.0;
			if ((obj_mouse.inv_drag == id) && (obj_mouse.slot_drag == i))
 			{
				alpha = 0.5;
			}
			draw_set_alpha(alpha);
			draw_sprite(spr_all_items, inventory[i], xx, yy); 
			
			if (stack[i] > 1)
			{
				draw_text(xx,yy,stack[i]);
			}
			draw_set_alpha(1.0); 
			
			if (inventory[i] >= obj_mouse.weapon_start && inventory[i] <= obj_mouse.leg_end)
			{
				max_stack[i] = 1;	
			}
			else
			{
				max_stack[i] = 20;	
			}
		}
		else
		{
			max_stack[i] = 1;
			stack[i] = 0;
		}

	}
}
