	textbox_x = 75;
	textbox_y = 325;

if (setup == false)
{
	setup = true;
	draw_set_font(fnt_default);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
		
		
	for (var i = 0; i < page_num; i++)
	{
		text_length[i] = string_length(text[i]);
		
		text_xx[i] = 50;
		portrait_xx[i] = 500;
		
		
		if (speaker_side[i] == -1)
		{
			text_xx[i] = 60;
			portrait_xx[i] = 50;
		}
		
		if (speaker_spr[i] == noone)
		{
			text_xx[i] = 200;
		}
		
	
		
		for (var c = 0; c < text_length[i]; c++)
		{
			var char_pos = c+1;
			char[c,i] = string_char_at(text[i],char_pos);
			var text_up_to_char = string_copy(text[i],1,char_pos);
			var current_text_w = string_width(text_up_to_char) - string_width(char[c,i]);
			if (char[c,i] == " ")
			{
				last_space = char_pos+1;	
			}
			if (current_text_w - line_break_offset[i] > line_width)
			{
				line_break_pos[line_break_num[i],i] = last_space;
				line_break_num[i]++;
				var text_up_to_last_space = string_copy(text[i],1,last_space);
				var last_free_space_string = string_char_at(text[i],last_space); 
				line_break_offset[i] = string_width(text_up_to_last_space) - string_width(last_free_space_string);
			}
			
		}
		for (var c = 0; c < text_length[i]; c++)
		{
			var char_pos = c+1;
			var txt_x = textbox_x + text_xx[i] + border;
			var txt_y = textbox_y + border;
			var text_up_to_char = string_copy(text[i],1,char_pos);
			var current_text_w = string_width(text_up_to_char) - string_width(char[c,i]);
			var text_line = 0;
			
			for (var b = 0; b < line_break_num[i]; b++)
			{
				if (char_pos >= line_break_pos[b,i])
				{
					var _string_copy = string_copy(text[i],line_break_pos[b,i],char_pos-line_break_pos[b,i]);
					current_text_w = string_width(_string_copy);
					text_line = b+1; 
				}	
			}
			charx[c,i] = txt_x + current_text_w;
			chary[c,i] = txt_y + text_line*line_sep;
		}
	
	}

}

if (text_pause_timer <= 0)
{
	if (draw_char < text_length[page]) 
	{
		draw_char += text_spd; 
		draw_char = clamp(draw_char,0,text_length[page]);
		var _check_char = string_char_at(text[page],draw_char);
		if (_check_char == "." || _check_char == ",")
		{
			text_pause_timer = pause_time;
		}
		else
		{
			if (sound_count < sound_delay)
			{
				sound_count++;	
			}
			else
			{
				sound_count = 0;
				audio_play_sound(snd[page],8,0);
			}
		}
	}
}
else
{
	text_pause_timer--;	
}




var _text_x = textbox_x + text_xx[page];
var _text_y = textbox_y;

text_img += text_img_spd; /// Animate the Sprite
text_spr_w = sprite_get_width(text_spr[page]); 
text_spr_h = sprite_get_height(text_spr[page]);

if (speaker_spr[page] != noone)
{
	sprite_index = speaker_spr[page];
	if (draw_char == text_length[page])
	{
		image_index = 0;	
	}
	var _speaker_x = textbox_x + portrait_xx[page];
	if (speaker_side[page] == -1)
	{
		_speaker_x += sprite_width;
	}	
	draw_sprite_ext(text_spr[page], text_img, textbox_x + portrait_xx[page], textbox_y, sprite_width/text_spr_w, sprite_height/text_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}

draw_sprite_ext(text_spr[page], text_img, _text_x, _text_y, text_width/text_spr_w, text_height/text_spr_h, 0, c_white,.75);

if (draw_char == text_length[page] and page == page_num - 1)
{
	option_pos += obj_input.s - obj_input.w;
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up); 
	option_pos = clamp(option_pos,0,option_num-1);
	
	
	var op_space = 30;
	var op_border = 15; 

	for (var j = 0; j < option_num; j++)
	{
		sel_img += sel_img_spd;
		
		var o_w = string_width(option[j]) + op_border*2;
		draw_sprite_ext(text_spr[page], text_img, _text_x + 30, _text_y - op_space*option_num + op_space*j, o_w/text_spr_w, (op_space - 5)/text_spr_h, 0, c_white, .75);
		if (option_pos == j)
		{
			draw_sprite(spr_selection,sel_img,_text_x + 15,_text_y - op_space*option_num + 10 + op_space*j);
		}
		draw_text(_text_x + 20 + op_border, _text_y - op_space*option_num + op_space*j + 5, option[j]);
	}
}          

                
for (var c = 0; c < draw_char; c++)
{
	var _float_y = 0;
	if (float_text[c,page] == true)
	{
		float_dir[c,page] -= 6;
		_float_y = dsin(float_dir[c,page]) * 10; 
	}
	
	var shake_x = 0;
	var shake_y = 0;
	if (shake_text[c,page] == true)
	{
		shake_timer[c,page]--;
		if (shake_timer[c,page] <= 0)
		{
			shake_timer[c,page] = irandom_range(4,8); 
			shake_dir[c,page] = irandom(360);
			shake_x = lengthdir_x(5,shake_dir[c,page]);
			shake_y = lengthdir_y(5,shake_dir[c,page]);
		}
		
	}

	draw_text_color(charx[c,page] + shake_x,chary[c,page] + _float_y + shake_y,char[c,page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1);
}
