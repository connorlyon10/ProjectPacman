/// @description Draw Score, lives and fruit.

//Draw 'ready' text if game is starting
if alarm[0] > 0
{
	Draw_Text_Colour(RESOLUTION_W/2,RESOLUTION_H/2+15,"Ready!","middle",c_yellow)
}


//Score
Draw_Text_At(0,0, "Score:")
Draw_Text_At(0,9, global.score)
//High Score
Draw_Text_At(RESOLUTION_W,0,"High Score:", "right")
Draw_Text_At(RESOLUTION_W,9, global.highscore, "right")


//Draw Lives
for (var i = 0; i < global.lives; i++)
{
	draw_sprite_ext(spr_pacman,2,24+(18*(i-1)),RESOLUTION_H-10,1,1,180,c_white,1)
}


//Draw Fruit
