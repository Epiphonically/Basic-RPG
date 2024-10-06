
function scr_chance(percent)
{
	percent = clamp(percent,0,1); 
	return (random(1) < percent);
}

function scr_between_frames(low, high) 
{
	return (image_index < high and image_index > low); 
}

function world_to_gui(x, y) {
    return [(x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0])), (y - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]))];
}

function scr_hit_frame(frame)
{
	var spd = sprite_get_speed(sprite_index) * image_speed;
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond) 
	{
        spd /= game_get_speed(gamespeed_fps);
    }

    return image_index >= frame && image_index - spd < frame;
}

function quest_start(quest_id, quest_name)
{
	global.tracked_quest = quest_id;	
	global.quest_progress_map[? quest_name] = 1;
	global.quest_active[quest_id] = true;
}

function quest_end(quest_id, quest_name)
{
	global.tracked_quest = 0;
	global.quest_active[quest_id] = false;
	global.quest_progress_map[? quest_name] = 3;
}	