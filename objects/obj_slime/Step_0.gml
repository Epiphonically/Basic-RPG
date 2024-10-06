randomize();
switch (state)
{
	case "idle":
	can_start_move = false;
	image_alpha = 1;
	image_blend = c_white;
	move_axis();
	choose_state();
	check_for_player();
	break;
	
	case "wander":
	can_start_move = false; 
	move_axis();
	choose_state();
	check_for_player();
	break;
	
	case "chase":
	alarm[1] = random_range(0,room_speed*1);
	if (can_start_move == true)
	{
		image_speed = 1;
	}	
	var dir = point_direction(x,y,obj_player.x,obj_player.y)
	var xspd = lengthdir_x(spd,dir);
	var yspd = lengthdir_y(spd,dir);
	image_xscale = sign(x - obj_player.x);
	if (image_xscale == 0)
	{
		image_xscale = 1;	
	}
	if (!place_meeting(x+xspd,y,obj_wall) && scr_between_frames(11,20))
	{
		x += xspd;
	}
	if (!place_meeting(x,y+yspd,obj_wall) && scr_between_frames(11,20))
	{
		y += yspd;
	}
	check_for_player();
	
	break;
	
	case "knockback":
	image_speed = 0;
	image_index = 0;
	image_alpha = 0.75;
	image_blend = c_red;
	knockback -= 0.1;
	var xspd = lengthdir_x(knockback,kbdir);
	var yspd = lengthdir_y(knockback,kbdir);
	if (!place_meeting(other.x+xspd,other.y,obj_wall))
	{
		other.x += xspd;
	}
	if (!place_meeting(other.x,other.y+yspd,obj_wall))
	{
		other.y += yspd;
	}
	if (knockback == 0)
	{
		state = "idle"; 
	}	
	break;
}
depth = -y;
if (hp <= 0)
{
	instance_destroy();	
}
