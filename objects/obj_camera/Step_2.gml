camera_set_view_size(VIEW,view_width*window_scale,view_height*window_scale);
if (instance_exists(obj_player))
{
	var xx = clamp(obj_player.x - view_width/2,0,room_width-view_width);
	var yy = clamp(obj_player.y - view_height/2,0,room_height-view_height);
	var cx = camera_get_view_x(VIEW);
	var cy = camera_get_view_y(VIEW);
	var spd = 0.1;
	
	camera_set_view_pos(VIEW,lerp(cx,xx,spd),lerp(cy,yy,spd));
}
