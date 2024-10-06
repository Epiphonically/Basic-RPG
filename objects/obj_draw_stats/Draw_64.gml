var maxlen = 150;

var today_time = minute_counter mod 1440;
var ratio_elapsed = today_time/1440;
var clockhand_angle = -(ratio_elapsed*360);
draw_sprite_ext(spr_clock, 0, time_x, time_y, 1, 1, 0, c_white, 1);
var len = maxlen*((obj_player.hp)/(obj_player.maxhp)) - 2;
draw_sprite_ext(spr_healthbar_case, 0, playerhpx, playerhpy, (maxlen/3), 1, 0, c_white, 1);
draw_sprite_ext(spr_healthbar, 0, playerhpx + 1, playerhpy, len, 1, 0, c_white, 1); 
draw_text(time_x, time_y + 50, (string(global._10hour) + string(global._1hour) + ":" + string(global._10minute) + string(global._1minute)));
draw_sprite_ext(spr_clockhand, 0, time_x, time_y, 1, 1, clockhand_angle, c_white, 1);

draw_text(playerlevelx, playerlevely, "Lv:" + string(obj_player.level));
//Quests
if (global.tracked_quest > 0)
{
	draw_sprite_ext(spr_quest_border, 0, quest_x - 10, quest_y - 10, 5, 4, 0, c_white, 1);
	draw_text(quest_x, quest_y, global.quest[global.tracked_quest]);
	draw_text(quest_x, quest_y + 20, global.quest_instructions);
}