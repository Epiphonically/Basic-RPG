if (global.quest_active[1] == true && global.slimes_killed < global.slime_kills_needed)
{
	global.slimes_killed += 1;	
}


	var expr = instance_create_depth(x,y,depth,obj_exp);
	expr.exp_gain = 30;