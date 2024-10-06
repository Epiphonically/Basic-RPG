
	
	if (immunity == false)
	{
		hp -= other.damage;
		knockback = other.knockback_attack_len;
		kbdir = point_direction(other.x,other.y,x,y);
		state = "knockback";	
		immunity = true;
		alarm[0] = room_speed * 0.5;
	}