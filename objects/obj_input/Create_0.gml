w = keyboard_check(ord("W"));
a = keyboard_check(ord("A"));
s = keyboard_check(ord("S"));
d = keyboard_check(ord("D"));
pick_up = keyboard_check_pressed(vk_space); 
attack = mouse_check_button_pressed(mb_left); 
inventory_button = keyboard_check_pressed(ord("E"));
pause = keyboard_check_pressed(vk_escape); 
xaxis = (d - a);
yaxis = (s - w); 

global.paused = false;