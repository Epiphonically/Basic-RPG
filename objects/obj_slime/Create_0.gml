randomize();
state = "idle";
len = 0;
spd = random_range(0.5,1);
sight = 250;
xaxis = 0;
knockback = 0;
kbdir = 0;
yaxis = 0;
image_speed = 0;
hp = 3;
can_start_move = false;
knockback_attack_len = 3;
damage = 1;
alarm[0] = room_speed*irandom_range(2,3);
function move_axis()
{
	
	var dir = point_direction(0,0,xaxis,yaxis); 
	var xspd = lengthdir_x(len,dir);
	var yspd = lengthdir_y(len,dir); 
	
	

	if (!place_meeting(x+xspd,y,obj_wall) && scr_between_frames(11,20))
	{
		x += xspd;
	}
	if (!place_meeting(x,y+yspd,obj_wall) && scr_between_frames(11,20))
	{
		y += yspd;
	}

}

function choose_state()
{
	if (alarm[0] <= 0)
	{
	    state = choose("wander","idle","wander");
	    alarm[0] = room_speed*irandom_range(2, 3); 
	    if (state == "wander")
	    {
			image_index = 0;
			image_speed = 1;
	        xaxis = choose(-1,1);
	        yaxis = random_range(-1,1);
			image_xscale = -xaxis;
			if (image_xscale == 0)
			{
				image_xscale = choose(-1,1);	
			}
			len = spd;
	    }
		if (state == "idle")
		{
			image_index = 0; 
			image_speed = 0;
			len = 0;
		}
	} 
}	

function check_for_player()
{
	var dis = point_distance(x,y,obj_player.x,obj_player.y);
	
	if (dis < sight)
	{
		state = "chase"; 	
	}
	else
	{
		choose_state();	
	}
}