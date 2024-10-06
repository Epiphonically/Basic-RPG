x = obj_player.helmetposx;
y = obj_player.helmetposy;

switch (helmet)
{
	case -1:
	sprite_index = noone;
	break;
	
	case 0:
	sprite_index = spr_all_items;
	image_index = 0;
	break;
	
	case 1: 
	sprite_index = spr_all_items;
	image_index = 1;
	break;
}

depth = obj_player.depth - 1;