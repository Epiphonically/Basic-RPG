switch (state)
{
	#region move
	case "move":	
	image_blend = c_white;
	image_alpha = 1;
	movement = MOVE; 
	var face_angle = point_direction(x,y,mouse_x,mouse_y); 
	if (face_angle > 315 || face_angle < 45)
	{
		face = RIGHT;
		with (obj_equipment)
		{
			image_xscale = 1;	
		}
		image_xscale = 1;
	}
	if (face_angle > 45 && face_angle < 135)
	{
		face = UP;
		with (obj_equipment)
		{
			image_xscale = 1;	
		}
		image_xscale = 1;
	}
	if (face_angle > 135 && face_angle < 225)
	{
		face = LEFT;	

		with (obj_equipment)
		{
			image_xscale = -1;	
		}
		image_xscale = -1;
	}
	if (face_angle > 225 && face_angle < 315)
	{
		face = DOWN; 
		with (obj_equipment)
		{
			image_xscale = 1;	
		}
		image_xscale = 1;
	}
	var dir = point_direction(0,0,obj_input.xaxis,obj_input.yaxis);
	if (obj_input.xaxis == 0 && obj_input.yaxis == 0)
	{
		len = 0;	
		image_speed = 0;
		image_index = 0;
	}
	else
	{
		len = spd;	
		image_speed = 0.5;
	}
	 
	var xspd = lengthdir_x(len,dir);
	var yspd = lengthdir_y(len,dir);
	if (!place_meeting(x+xspd,y,obj_wall) && !instance_exists(obj_speaker))
	{
		x += xspd;
	}
	if (!place_meeting(x,y+yspd,obj_wall) && !instance_exists(obj_speaker))
	{
		y += yspd; 
	}
	
	if (obj_input.attack)
	{
		var xdir = lengthdir_x(30,face*90);
		var ydir = lengthdir_y(30,face*90);
		var speaker = instance_place(x+xdir,y+ydir,obj_has_speaker);
		with (speaker)
		{
			create_textbox(text_id); 
		}
		
		var door = instance_place(x+xdir, y+ydir, obj_door);
		with (door)
		{
			if (global.door_unlocked[? door_id] == false)
			{
				if (inv_search(obj_inventory, 3) != -1)
				{
					global.door_unlocked[? door_id] = true;
					inv_remove(obj_inventory, 3, 1);
					create_textbox("Door Unlocked");
				}
				else
				{
					create_textbox("Door Locked");	
				}
			}
			else
			{
				if (!instance_exists(obj_speaker))
				{
					room = newroom;
					other.x = newx;
					other.y = newy; 
				}
			}
		}
		
		var station = instance_place(x+xdir,y+ydir,obj_station)
		with (station)
		{
			opened = true;	
		}
		
		if (openinventory == false)
		{
			state = "attack1"; 	
		}
		else
		{
			exit;	
		}
		
		
	}
	
	if (obj_input.inventory_button)
	{
		if (openinventory == false)
		{
			openinventory = true; 	
		}
		else
		{
			openinventory = false; 	
		}
	}
	
	if (obj_input.pick_up)
	{
		var nearest = instance_nearest(x,y,obj_item_parent); 
		var xdir = lengthdir_x(pickuplen,face*90);
		var ydir = lengthdir_y(pickuplen,face*90);
		var item = instance_place(x+xdir,y+ydir,nearest);
		if (instance_exists(item))
		{
			inv_add(obj_inventory,item.item_id); 
			with (item)
			{
				instance_destroy();	
			}
		}
	}
	break;
	#endregion
	
	#region attack1
	case "attack1":
	image_blend = c_white;
	gethitboxpos();
	getcombolen();
	if (movement != ATTACK1)
	{
		movement = ATTACK1; 
		image_index = 0;
	}
	image_speed = 1.5;
	

	if (scr_hit_frame(1))
	{
		var hitbox = instance_create_depth(xx+comboxlen,yy+comboylen,-1,obj_hitbox);
		hitbox.creator = id;
		hitbox.creator_weapon = obj_weapon.weapon;
		hitbox.damage = 1;
	}
	if (obj_input.attack)
	{
		if (scr_between_frames(0,1))
		{
				cancombo = false;
		}
		if (scr_between_frames(2,5) && cancombo == true)
		{
			state = "attack2";	
		}
	}
	
	break; 
	#endregion
	
	#region attack2
	image_blend = c_white;
	case "attack2":
	gethitboxpos();
	getcombolen();
	if (movement != ATTACK2)
	{
		movement = ATTACK2;
		image_index = 0;
	}
	
	if (scr_hit_frame(1))
	{
		var hitbox = instance_create_depth(xx+comboxlen,yy+comboylen,-1,obj_hitbox);
		hitbox.creator = id;
		hitbox.damage = 1;
	}
	
		if (obj_input.attack)
		{
			if (scr_between_frames(0,1))
			{
				cancombo = false;
			}
			if (scr_between_frames(2,5) && cancombo == true)
			{
				state = "attack3";	
			}
			
		}	
	break;
	#endregion
	
	#region attack3
	case "attack3":
	image_blend = c_white;
	gethitboxpos();
	getcombolen();
	if (movement != ATTACK3)
	{
		movement = ATTACK3;
		image_index = 0;
	}
	if (scr_hit_frame(1))
	{
		var hitbox = instance_create_depth(xx+comboxlen,yy+comboylen,-1,obj_hitbox);
		hitbox.creator = id;
		hitbox.damage = 1;
	}

	break;
	#endregion
	
	#region knockback
	case "knockback":
	image_index = 0;
	image_speed = 0;
	image_blend = c_red;
	image_alpha = 0.8;
	knockback -= 0.1;
	if (knockback > 0)
	{
		var xspd = lengthdir_x(knockback,kbdir);
		var yspd = lengthdir_y(knockback,kbdir);
		if (!place_meeting(x+xspd,y,obj_wall))
		{
			x += xspd;
		}
		if (!place_meeting(x,y+yspd,obj_wall))
		{
			y += yspd; 
		}
	}
	else
	{
		state = "move";	
	}
	
	break;
	#endregion
}

#region BOB
	if (scr_hit_frame(0))
	{
		xbob = 0;
		ybob = 0;
	}
	
	if (scr_hit_frame(1))
	{
		xbob = 0;
		ybob = -2;
	}
	
	if (scr_hit_frame(2))
	{
		xbob = 0;
		ybob = 0;
	}

	if (scr_hit_frame(3))
	{
		xbob = 0;
		ybob = -4;
	}
#endregion
	
switch (face)
{
	case RIGHT:
	handposx = x + 5 + xbob;
	handposy = y + 5 + ybob; 

	helmetposx = x + xbob;
	helmetposy = y + ybob;

	chestplateposx = x + xbob;
	chestplateposy = y + ybob;

	legposx = x + xbob;
	legposy = y + ybob;
	break;
	
	case UP:
	handposx = x + 10 + xbob;
	handposy = y + ybob; 

	helmetposx = x + xbob;
	helmetposy = y + ybob;

	chestplateposx = x + xbob;
	chestplateposy = y + ybob;

	legposx = x + xbob;
	legposy = y + ybob;
	break;
	
	case LEFT:
	handposx = x - 5 + xbob;
	handposy = y + 5 + ybob; 

	helmetposx = x + xbob;
	helmetposy = y + ybob;

	chestplateposx = x + xbob;
	chestplateposy = y + ybob;

	legposx = x + xbob;
	legposy = y + ybob;
	break;
	
	case DOWN:
	handposx = x - 13 + xbob;
	handposy = y + 5 + ybob; 

	helmetposx = x + xbob;
	helmetposy = y + ybob;

	chestplateposx = x + xbob;
	chestplateposy = y + ybob;

	legposx = x + xbob;
	legposy = y + ybob;
	break;
}

if (hp <= 0)
{
	game_restart();	
}
depth = -y;

sprite_index = sprite[face,movement];

if (_exp >= _expneeded)
{
	level++;	
	_exp -= _expneeded;
	_expneeded *= 1.5;
}
//show_debug_message(string(_exp));
//show_debug_message(string(_expneeded));


if (keyboard_check_pressed(ord("R")))
{
	game_restart();	
}