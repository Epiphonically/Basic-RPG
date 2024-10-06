if (other.destructable == true)
{
	if (ds_list_find_index(hit,other) != -1 || creator_weapon != 1)
	{
	    exit; 
	}
	if (other.id != creator)
	{
		other.hp -= damage;
		audio_play_sound(snd_hit, 1, 0);
		ds_list_add(hit,other);
	}
}