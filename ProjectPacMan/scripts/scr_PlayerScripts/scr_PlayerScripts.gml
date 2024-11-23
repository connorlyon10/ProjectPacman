function PlayerMovement()
{
    // Input tracking for direction
    var keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
    var keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
    var keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
    var keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
    
    if (CanMove(inputDir))
	{
		// Save current direction if it's a valid one
		currentDir = inputDir;
	}
	
	
    // Ensure only one direction is active
    if (keyRight) inputDir = 0; // Right
    else if (keyUp) inputDir = 90; // Up
    else if (keyLeft) inputDir = 180; // Left
    else if (keyDown) inputDir = 270; // Down


    // Check if input direction is valid
    if (inputDir != noone)
    {
        // If we can move in the input direction, do it
        if (CanMove(inputDir))
        {
            moveX = lengthdir_x(moveSpeed, inputDir);
            moveY = lengthdir_y(moveSpeed, inputDir);
        }
        else
        {
            // If we can't move in the input direction, hold the current direction if possible
            if (CanMove(currentDir))
            {
                moveX = lengthdir_x(moveSpeed, currentDir);
                moveY = lengthdir_y(moveSpeed, currentDir);
            }
            else
            {
                // If neither direction is valid (eg. at a corner wall), stop the movement
                moveX = 0;
                moveY = 0;
            }
        }
    }
    else
    {
        moveX = 0;
        moveY = 0;
    }

    // Move player
    x += moveX;
    y += moveY;
}


function CanMove(dir)
{
    // Calculate the target position based on the direction of travel
    var targetX = x + lengthdir_x(moveSpeed, dir);
    var targetY = y + lengthdir_y(moveSpeed, dir);

    // Get the bounding box corners of the sprite
    var bboxLeft = bbox_left + (targetX - x);
    var bboxRight = bbox_right + (targetX - x);
    var bboxTop = bbox_top + (targetY - y);
    var bboxBottom = bbox_bottom + (targetY - y);

    // Check only in the direction of movement (along the edge of the bounding box in the target direction)
    switch (dir)
    {
        case 0: // Right
            // Check the right side of the bounding box (right edge in movement direction)
            return !tilemap_get_at_pixel(collisionMap, bboxRight, targetY);
        case 90: // Up
            // Check the top side of the bounding box (top edge in movement direction)
            return !tilemap_get_at_pixel(collisionMap, targetX, bboxTop);
        case 180: // Left
            // Check the left side of the bounding box (left edge in movement direction)
            return !tilemap_get_at_pixel(collisionMap, bboxLeft, targetY);
        case 270: // Down
            // Check the bottom side of the bounding box (bottom edge in movement direction)
            return !tilemap_get_at_pixel(collisionMap, targetX, bboxBottom);
        default:
            return true;  // In case of an invalid direction, no collision
    }
}


function PlayerAnimation()
{
    if (moveX == 0 && moveY == 0)
    {
        image_speed = 0;
    }
    else
    {
        image_speed = 1;
        if (inputDir != noone) && (CanMove(inputDir)) {image_angle = inputDir}
    }
}

