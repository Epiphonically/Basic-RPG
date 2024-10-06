
if (obj_input.attack) ///clear
{
	if (draw_char == text_length[page])
	{
		if (page < page_num - 1)/// -1 cause you dont want to add another page on the last page lmao
		{
			page++
			draw_char = 0; 
		}
		else
		{
			instance_destroy();
			if (option_num > 0)
			{
				create_textbox(option_link_id[option_pos]);
			}		
			
		}
	}
	else
	{
		draw_char = text_length[page];	
	}
}