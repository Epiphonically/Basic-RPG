if (ds_list_find_index(hit,other) != -1)
{
    exit; 
}
if (other.id != creator)
{	
	switch (obj_player.face)
	{
		case 0:
		other.kbdir = 0;
		break;
		
		case 1:
		other.kbdir = 90;
		break;
		
		case 2:
		other.kbdir = 180;
		break;
		
		case 3:
		other.kbdir = 270;
		break;
	}
	switch (obj_player.state)
	{
		case "attack1":
		kb_scalar = 0.5;
		break;
		
		case "attack2":
		kb_scalar = 1;
		break;
		
		case "attack3":
		kb_scalar = 2;
		break;
	}
	other.knockback = knockback + kb_scalar;
	other.state = "knockback";
    other.hp -= damage; 
	audio_play_sound(snd_hit, 1, 0);
    ds_list_add(hit,other); 
}