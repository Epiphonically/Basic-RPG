function set_default()
{
	line_break_pos[0,page_num] = 999;
	line_break_num[page_num] = 0;
	line_break_offset[page_num] = 0;
	
	text_spr[page_num] = spr_textbox;	
	speaker_spr[page_num] = noone;
	speaker_side[page_num] = 1;
	
	snd[page_num] = snd_text;
	
	for (var c = 0; c < 500; c++)
	{
		col_1[c,page_num] = c_white;
		col_2[c,page_num] = c_white;
		col_3[c,page_num] = c_white;
		col_4[c,page_num] = c_white;
		float_text[c,page_num] = 0; ///0 for false
		float_dir[c,page_num] = c*20;
		shake_text[c,page_num] = 0;
		shake_dir[c,page_num] = irandom(360);
		shake_timer[c,page_num] = irandom(4);
	}
}


function scr_text_color(_start,_end,_col1,_col2,_col3,_col4)
{
	for (var c = _start; c <= _end; c++)
	{
		col_1[c,page_num-1] = _col1;	
		col_2[c,page_num-1] = _col2;	
		col_3[c,page_num-1] = _col3;	
		col_4[c,page_num-1] = _col4;	
		
	}
}

/// @param text
/// @param character
/// @param side
function scr_text(_text)
{
	set_default();
	text[page_num] = _text;

	
	if (argument_count > 1)
	{
		switch (argument[1])
		{
			case "old_man":
			text_spr[page_num] = spr_textbox;
			break;
		}
	}
	
	if (argument_count > 2)
	{
		speaker_side[page_num] = argument[2];	
	}
	page_num++;

}


function scr_option(_option,_link_id)
{
	option[option_num] = _option;
	option_link_id[option_num] = _link_id;
	option_num++; 
}

function create_textbox(_text_id)
{
	if (!instance_exists(obj_speaker))
	{
		with (instance_create_depth(-100000,0,99999,obj_speaker))
		{	
			scr_different_text(_text_id);
		}
	}
}

function scr_text_float(_start,_end)
{
	for (var c = _start; c <= _end; c++)
	{
		float_text[c,page_num-1] = true;	
	}
}

function scr_text_shake(start_,end_)
{
	for (var c = start_; c <= end_; c++)
	{
		shake_text[c,page_num-1] = true; 	
	}
}