
switch (obj_player.face)
{
	case RIGHT:
		depth = obj_player.depth - 1;
		slash_frame = obj_player.image_index;
		slash_xpos = obj_player.x + 30;
		slash_ypos = obj_player.y;
		slash_rot = 270;
	break;
	
	case UP:
		depth = obj_player.depth + 1;
		slash_frame = obj_player.image_index;
		slash_xpos = obj_player.x + 10;
		slash_ypos = obj_player.y - 20;
		slash_rot = 0;
	break;
			
	case LEFT:
		depth = obj_player.depth + 1;
		slash_frame = obj_player.image_index;
		slash_xpos = obj_player.x - 30;
		slash_ypos = obj_player.y;
		slash_rot = 90;
	break;
			
	case DOWN:
		depth = obj_player.depth - 1;
		slash_frame = obj_player.image_index;
		slash_xpos = obj_player.x - 10;
		slash_ypos = obj_player.y + 20;
		slash_rot = 180;
	break;
}
if (obj_sword_slot.inventory[0] != -1)
{
	switch (obj_player.state)
	{
		case "attack1":
			draw_sprite_ext(spr_slash1,slash_frame,slash_xpos,slash_ypos,2,2,slash_rot,c_white,1);
		break;
	
		case "attack2":
			draw_sprite_ext(spr_slash2,slash_frame,slash_xpos,slash_ypos,2,2,slash_rot,c_white,1);
		break;
	
		case "attack3":
			draw_sprite_ext(spr_slash3,slash_frame,slash_xpos,slash_ypos,2,2,slash_rot,c_white,1);
		break;
	}
}
