if (obj_player.openinventory == false)
{
	if (stack[0] == 0)
	{
		inventory[0] = -1;	
	}
	exit;
}
else
{
	draw_sprite_stretched(spr_inventory,
	0,
	defaultx + display_get_gui_width(),
	defaulty + display_get_gui_height(),
	margin*2 + inventory_width * slot_width,
	margin*2 + 1 * slot_width
	);
	var xx = defaultx + display_get_gui_width() + 8;
	var yy = defaulty + display_get_gui_height() + 8;
	var hover = (obj_mouse.inv_hover == id) && (obj_mouse.slot_hover == 0)
	draw_sprite(spr_inventory_slot,hover,xx,yy);
	if (stack[0] == 0)
	{
		inventory[0] = -1;	
	}
	if (inventory[0] != -1)
	{
			var alpha = 1.0;
			if ((obj_mouse.inv_drag == id) && (obj_mouse.slot_drag == 0))
			{
				alpha = 0.5;
			}
			draw_set_alpha(alpha);
			draw_sprite(spr_all_items, inventory[0], xx, yy); 
			draw_set_alpha(1.0); 
	}

}