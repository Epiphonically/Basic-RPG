if (obj_player.openinventory = false)
{
	exit;	
}
else
{
	var guipos = world_to_gui(mouse_x,mouse_y);
	guix = guipos[0];
	guiy = guipos[1];
	state();
}
depth = -10000;