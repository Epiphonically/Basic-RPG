inv_hover = -1;
slot_hover = -1;
inv_drag = -1;
slot_drag = -1;
item_drag = -1;
guix = 0;
guiy = 0;

//Do not overlap starts and ends for different parts e.g. helm end cannot match chestplate start, stagger by 1 plspls

weapon_start = 0;
weapon_end = 1;

helmet_start = 2;
helmet_end = 3;

chestplate_start = 4;
chestplate_end = 5;

leg_start = 6;
leg_end = 7;

mouse_over = function()
{
	slot_hover = -1;
	inv_hover = -1;
	
	var mx = mouse_x;
	var my = mouse_y;
	
	with (obj_inventory)
	{	
		var _x = camera_get_view_x(VIEW) + 20;
		
		
		var _y = camera_get_view_y(VIEW) + 20;
		
		if (point_in_rectangle
		(mx,
		my,
		_x - margin,
		_y - margin,
		_x - margin + margin*2 + inventory_width * slot_width,
		_y - margin + margin*2 + (((INV_SPACE - 1) div inventory_width) + 1) * slot_width
		))
		{
			for (var i = 0; i < INV_SPACE; i++)
			{
				var xx = _x + (i % inventory_width) * slot_width + 2;
				var yy = _y + (i div inventory_width) * slot_width + 2;
				if (point_in_rectangle(mx, my, xx, yy, xx + 32, yy + 32))
				{
					other.slot_hover = i;
					other.inv_hover = id;
				}
			}
		}
	}
	
	with (obj_sword_slot)
	{
		var _x = camera_get_view_x(VIEW) + display_get_gui_width() + defaultx;
		
		var _y = camera_get_view_y(VIEW) + display_get_gui_height() + defaulty;
	
			
		if (point_in_rectangle(
		mx,
		my,
		_x - margin,
		_y - margin,
		_x + margin + slot_width,
		_y + margin + slot_width
		))
		{
			var xx = _x + slot_width + 2;
			var yy = _y + slot_width + 2;
			if (point_in_rectangle(mx, my, xx - 32, yy - 32, xx, yy))
			{
				other.slot_hover = 0;
				other.inv_hover = id;
			}
		}

	}
	
	with (obj_helmet_slot)
	{
		var _x = camera_get_view_x(VIEW) + display_get_gui_width() + defaultx;
		
		var _y = camera_get_view_y(VIEW) + display_get_gui_height() + defaulty;
	
			
		if (point_in_rectangle(
		mx,
		my,
		_x - margin,
		_y - margin,
		_x + margin + slot_width,
		_y + margin + slot_width
		))
		{
			var xx = _x + slot_width + 2;
			var yy = _y + slot_width + 2;
			if (point_in_rectangle(mx, my, xx - 32, yy - 32, xx, yy))
			{
				other.slot_hover = 0;
				other.inv_hover = id;
			}
		}

	}
	
	with (obj_chestplate_slot)
	{
		var _x = camera_get_view_x(VIEW) + display_get_gui_width() + defaultx;
		
		var _y = camera_get_view_y(VIEW) + display_get_gui_height() + defaulty;
	
			
		if (point_in_rectangle(
		mx,
		my,
		_x - margin,
		_y - margin,
		_x + margin + slot_width,
		_y + margin + slot_width
		))
		{
			var xx = _x + slot_width + 2;
			var yy = _y + slot_width + 2;
			if (point_in_rectangle(mx, my, xx - 32, yy - 32, xx, yy))
			{
				other.slot_hover = 0;
				other.inv_hover = id;
			}
		}

	}
	
	with (obj_leg_slot)
	{
		var _x = camera_get_view_x(VIEW) + display_get_gui_width() + defaultx;
		
		var _y = camera_get_view_y(VIEW) + display_get_gui_height() + defaulty;
	
			
		if (point_in_rectangle(
		mx,
		my,
		_x - margin,
		_y - margin,
		_x + margin + slot_width,
		_y + margin + slot_width
		))
		{
			var xx = _x + slot_width + 2;
			var yy = _y + slot_width + 2;
			if (point_in_rectangle(mx, my, xx - 32, yy - 32, xx, yy))
			{
				other.slot_hover = 0;
				other.inv_hover = id;
			}
		}

	}
	
}

statefree = function()
{
	mouse_over();
	
	if ((mouse_check_button(mb_left)) && (slot_hover != -1) && (inv_hover.inventory[slot_hover] != -1))
	{
		state = statedrag;
		item_drag = inv_hover.inventory[slot_hover];
		inv_drag = inv_hover;
		slot_drag = slot_hover;
	}
}

statedrag = function()
{


	mouse_over(); 
	if (!mouse_check_button(mb_left))
	{
		if (slot_hover != -1)
		{

			switch (inv_hover)
			{
				case obj_inventory.id:
				inv_swap(inv_drag,slot_drag,inv_hover,slot_hover);
				break;
				
				case obj_sword_slot.id:
				if (inv_drag.inventory[slot_drag] >= weapon_start && inv_drag.inventory[slot_drag] <= weapon_end)
				{
					inv_swap(inv_drag,slot_drag,inv_hover,slot_hover);
				}
				break;
				
				case obj_helmet_slot.id:
				if (inv_drag.inventory[slot_drag] >= helmet_start && inv_drag.inventory[slot_drag] <= helmet_end)
				{
					inv_swap(inv_drag,slot_drag,inv_hover,slot_hover);	
				}
				break;
				
				case obj_chestplate_slot.id:
				if (inv_drag.inventory[slot_drag] >= chestplate_start && inv_drag.inventory[slot_drag] <= chestplate_end)
				{
					inv_swap(inv_drag,slot_drag,inv_hover,slot_hover);	
				}
				break;
			
				case obj_leg_slot.id:
				if (inv_drag.inventory[slot_drag] >= leg_start && inv_drag.inventory[slot_drag] <= leg_end)
				{
					inv_swap(inv_drag,slot_drag,inv_hover,slot_hover);	
				}
				break; 
				
			}
			

		}	
		state = statefree;
		item_drag = -1;
		inv_drag = -1;
		slot_drag = -1;
	}

}

state = statefree; 
