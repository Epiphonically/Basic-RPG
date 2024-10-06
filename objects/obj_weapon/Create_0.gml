x = obj_player.handposx;
y = obj_player.handposy;
slash_ani_spd = 10;
weapon = 0;
setup1 = false;
setup2 = false;
setup3 = false;


default_angle_right = 285;
default_angle_up = 0;
default_angle_left = 0;
default_angle_down = 180;

check_face_angle[RIGHT] = default_angle_right;
check_face_angle[UP] = default_angle_up;
check_face_angle[LEFT] = default_angle_left;
check_face_angle[DOWN] = default_angle_down;

function default_angle()
{
	setup1 = false;
	setup2 = false;
	setup3 = false;
			switch (obj_player.face)
			{
				case RIGHT:

				depth = obj_player.depth - 2;
				image_angle = default_angle_right;
				break;
	
				case UP:
	
				depth = obj_player.depth + 2;
				image_angle = default_angle_up;
				break;
	
				case LEFT:
		
				depth = obj_player.depth + 2;
				image_angle = default_angle_left;
				break;
	
				case DOWN:
	
				depth = obj_player.depth - 2;
				image_angle = default_angle_down;
				break;
			}	
}
function permute()
{
	switch (obj_player.state)
	{
		case "move":
			default_angle();
		break;
		
		case "attack1":
		if (setup1 == false)
		{
			default_angle();
			setup1 = true;
		}
		if (image_angle <= check_face_angle[obj_player.face] + 80)
		{
				image_angle += slash_ani_spd;
		}

		break;
		
		case "attack2":
		if (setup2 == false)
		{
			default_angle();
			setup2 = true;
		}
		if (image_angle <= check_face_angle[obj_player.face] + 90)
		{
				image_angle += slash_ani_spd;
		}
		break;
		
		case "attack3":
		if (setup3 == false)
		{
			default_angle();
			setup3 = true;
		}
		if (image_angle <= check_face_angle[obj_player.face] + 90)
		{
				image_angle += slash_ani_spd;
		}

		break;
	}
	switch (weapon)
	{
		case -1:
		sprite_index = noone;

		break;
	
		case 0:
		sprite_index = spr_held_items;
		image_index = 0;
		break;
	
		case 1: 
		sprite_index = spr_held_items;
		image_index = 1;
		break;
	
		case 2:
		sprite_index = spr_held_items;
		image_index = 2;
		break;
	}

}

