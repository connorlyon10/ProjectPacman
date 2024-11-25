/// @description Move and animate, if alive
if (alive)
{
	if obj_game.alarm[0] <= 0 //the nesting here is important
	{
		PlayerMovement();
		PlayerAnimation();
	}
}
else
{
	PlayerDeath();
	if global.lives > 0
	{
		room_goto(r_Level1);
		global.lives--;
	}
	else GameOver();
}


