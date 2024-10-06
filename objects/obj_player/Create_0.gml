movement = MOVE; 
face = RIGHT;
state = "move"; 

level = 1;
_exp = 0;
_expneeded = BASE_EXP;

spd = 2;
len = 0;
openinventory = false;
cancombo = true;
hp = 10;
maxhp = 10;
xx = 0;
yy = 0;
comboxlen = 0;
comboylen = 0;
pickuplen = 30;
combo_scalar = 2;
xbob = 0;
ybob = 0;
knockback = 0;
kbdir = 0;
immunity = false;


function gethitboxpos()
{
	switch (face)
	{
		case 0:
		xx = x + sprite_width/2 + 8;
		yy = y; 
		break;
		case 1:
		xx = x
		yy = y - sprite_height/4;
		break;
		case 2:
		xx = x + sprite_width/2 - 8;
		yy = y;
		break;
		case 3:
		xx = x;
		yy = y + sprite_height/2;
		break;
	}	
}

function getcombolen()
{
	switch (face)
	{
		case 0:
		switch (state)
		{
			case "attack1":
			comboxlen = 0;
			comboylen = 0;
			break;
			case "attack2":
			comboxlen = combo_scalar;
			comboylen = 0;
			break;
			case "attack3":
			comboxlen = combo_scalar*2;
			comboylen = 0;
			break;
		}
		break;
		case 1:
		switch (state)
		{
			case "attack1":
			comboxlen = 0;
			comboylen = 0;
			break;
			case "attack2":
			comboxlen = 0;
			comboylen = (combo_scalar)*-1;
			break;
			case "attack3":
			comboxlen = 0;
			comboylen = (combo_scalar)*-2;
			break;
		}
		break;
		case 2:
		switch (state)
		{
			case "attack1":
			comboxlen = 0;
			comboylen = 0;
			break;
			case "attack2":
			comboxlen = -combo_scalar;
			comboylen = 0;
			break;
			case "attack3":
			comboxlen = -combo_scalar*2;
			comboylen = 0;
			break;
		}
		break;
		case 3:
		switch (state)
		{
			case "attack1":
			comboxlen = 0;
			comboylen = 0;
			break;
			case "attack2":
			comboxlen = 0;
			comboylen = combo_scalar;
			break;
			case "attack3":
			comboxlen = 0;
			comboylen = combo_scalar*2;
			break;
		}
		break;
	}
}

handposx = 0;
handposy = 0; 

helmetposx = 0;
helmetposy = 0;

chestplateposx = 0;
chestplateposy = 0;

legposx = 0;
legposy = 0;


image_speed = 0;
#region Move
sprite[RIGHT,MOVE] = spr_player_right;
sprite[UP, MOVE] = spr_player_up;
sprite[LEFT, MOVE] = spr_player_right;
sprite[DOWN, MOVE] = spr_player_down;
#endregion

#region Attack1
sprite[RIGHT, ATTACK1] = spr_player_attack_right;
sprite[UP, ATTACK1] = spr_player_attack_up;
sprite[LEFT, ATTACK1] = spr_player_attack_right;
sprite[DOWN, ATTACK1] = spr_player_attack_down;
#endregion

#region Attack2
sprite[RIGHT, ATTACK2] = spr_player_attack_right;
sprite[UP, ATTACK2] = spr_player_attack_up;
sprite[LEFT, ATTACK2] = spr_player_attack_right;
sprite[DOWN, ATTACK2] = spr_player_attack_down;
#endregion

#region Attack3
sprite[RIGHT, ATTACK3] = spr_player_attack_right;
sprite[UP, ATTACK3] = spr_player_attack_up;
sprite[LEFT, ATTACK3] = spr_player_attack_right;
sprite[DOWN, ATTACK3] = spr_player_attack_down;
#endregion
//Two inventories, one for armor and sword and one for items!! 
