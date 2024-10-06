draw_self();
var maxlen = 150;
var len = maxlen*((hp)/(maxhp)) - 2;
draw_sprite_ext(spr_healthbar_case, 0, hpx, hpy, (maxlen/3), 1, 0, c_white, 1);
draw_sprite_ext(spr_healthbar, 0, hpx + 1, hpy, len, 1, 0, c_white, 1);
