function PlayerMovement()
{
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
	keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
	keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))

	inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
	inputMagnitude = (keyRight-keyLeft != 0) || (keyDown - keyUp != 0);
	
	xSpeed = lengthdir_x(inputMagnitude * moveSpeed, inputDirection);
	ySpeed = lengthdir_y(inputMagnitude * moveSpeed, inputDirection);

	PlayerCollision();
}

function PlayerCollision()
{
	///@desc Allows for collisions against walls. Looks at the destination, checks for an instance, and sets speed to zero if there is one. 'Walls' are in collisionMap which is a tile layer called 'Col'
	var _collision = false;
	
	
	//-----Horizontal Tiles-----
	if (tilemap_get_at_pixel(collisionMap, x + xSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(xSpeed) == 1)
		{
			x += TILE_SIZE - 1;
		}
		xSpeed = 0;
		_collision = true;
	}
		
	
	//-----Vertical Tiles-----
	if (tilemap_get_at_pixel(collisionMap, x, y+ySpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(ySpeed) == 1)
		{
			y += TILE_SIZE - 1;
		}
		ySpeed = 0;
		_collision = true;
	}
	
	
	//Commit to movement
	x += xSpeed
	y += ySpeed
	return _collision
}

function PlayerAnimation()
{
	if (xSpeed == 0) && (ySpeed == 0)
	{
		image_speed = 0
		image_index = 0
	}
	else image_speed = 1
	
	image_angle = inputDirection
}