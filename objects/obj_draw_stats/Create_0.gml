global.number_of_quests = 1+1;

#region quest_variables
	global.slimes_killed = 0;
	global.slime_kills_needed = 6;
	
	
	
	
	
#endregion

global.quest_instructions = "";

global.tracked_quest = 0;

global.quest_active = array_create(global.number_of_quests, false);

#region positions

playerhpx = 600;
playerhpy = 10;

playerlevelx = 600
playerlevely = 50;

playerenergy_x = 700
playerenergy_y = 200;

playeritem_x = 500;
playeritem_y = 200;

time_x = 700;
time_y = 75; 

quest_x = 500;
quest_y = 100;

#endregion

#region quest progress

global.quest_progress_map = ds_map_create();
global.quest_progress_map[? "Slimes"] = 0;

#endregion

#region quest names

global.quest[0] = "";
global.quest[1] = "Killing Slimes";

#endregion

#region time

global._1hour = 0;
global._10hour = 0;
global._1minute = 0;
global._10minute = 0; 
minute_counter = 0;
time_speed = 1;
alarm[0] = room_speed*time_speed;

time_delta = 1;

#endregion

#region doors

global.door_unlocked = ds_map_create();
global.door_unlocked[? "Bear Door"] = false;

#endregion