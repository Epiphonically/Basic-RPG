function scr_different_text(_text_id)
{
	switch(_text_id)
	{
		case "old_man":
			switch(global.quest_progress_map[? "Slimes"])
			{
				case 0: //Havent Started
					scr_text("x");
					scr_text("You There!!");	
					scr_text("Please help me good sir!");
					scr_option("What is it?","Whatisit");
					scr_option("No!","No");
				break;
				
				case 1: //Started but havent completed
					scr_text("x");
					scr_text("I need those slimes dead!");
				break;
				
				case 2: //Collecting Reward
					scr_text("x");
					scr_text("Thank you so much!");
					scr_text("Here is your reward.");
					inv_add(obj_inventory, 3);
					quest_end(1, "Slimes");
				break;
				
				case 3: //Done with quest
					scr_text("x");
					scr_text("I dont know what I wouldve done without you...");
				break;
			}
		
			
		break;
		
		case "Whatisit":
			scr_text("Slimes are ravaging my fields!!");
			scr_text("Please get rid of them!");
			scr_text("Theres a sword over there you can grab");
			quest_start(1, "Slimes");
		break;
			
		case "No":
			scr_text("Alright sir, I shall not burden you with my problems");
		break;
		
		case "Door Locked":
			scr_text("x");
			scr_text("Its Locked");
		break;
		
		case "Door Unlocked":
			scr_text("x");
			scr_text("Click!");
		break;
	}
}

