
global._10minute = (minute_counter div 10) mod 6;
global._1hour = (minute_counter div 60) mod 10;
global._10hour = (minute_counter div 600) mod 3;
if (minute_counter == 1440)
{
	minute_counter = 0;
}

switch (global.tracked_quest)
{
	case 0:
		global.quest_instructions = "";
	break;
	
	case 1:
		switch (global.quest_progress_map[? "Slimes"])
		{
			case 1:
				global.quest_instructions = "Kill all the slimes";
			break;
			
			case 2:
				global.quest_instructions = "Return to the bear";
			break;
		}	
	break;

}


if (global.quest_active[1] == true)
{
	if (global.slimes_killed == global.slime_kills_needed)
	{
		global.quest_progress_map[? "Slimes"] = 2;			
	}
}