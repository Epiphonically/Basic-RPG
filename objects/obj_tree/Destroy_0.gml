randomize();
for (var i = 0; i < irandom_range(3,6); i++)
{
	var xmargin = random_range(-10,10);
	var ymargin = random_range(-10,10);
	instance_create_depth(x+xmargin,y+ymargin,depth,obj_wood);
}