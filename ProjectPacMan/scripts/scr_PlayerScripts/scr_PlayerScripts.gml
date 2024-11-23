function PlayerMovement()
{
    // Input tracking for direction
    var keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
    var keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
    var keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
    var keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

    // Ensure only one direction is active
	if (keyRight) inputDir = 0; // Right
	else if (keyUp) inputDir = 90; // Up
	else if (keyLeft) inputDir = 180; // Left
    else if (keyDown) inputDir = 270; // Down
    

    // Calculate movement
    if ( (inputDir != noone) && (CanMove(inputDir)) )
    {
        var moveX = lengthdir_x(moveSpeed, inputDir);
        var moveY = lengthdir_y(moveSpeed, inputDir);
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






function CanMove(direction)
{
    // Calculate the target position based on the direction
    var targetX = x + lengthdir_x(moveSpeed, direction);
    var targetY = y + lengthdir_y(moveSpeed, direction);

    // Get the bounding box corners of the sprite
    var bboxLeft = bbox_left + (targetX - x);
    var bboxRight = bbox_right + (targetX - x);
    var bboxTop = bbox_top + (targetY - y);
    var bboxBottom = bbox_bottom + (targetY - y);

    // Tile collision check for all four corners of the bounding box
    return !(
        tilemap_get_at_pixel(collisionMap, bboxLeft, bboxTop) ||
        tilemap_get_at_pixel(collisionMap, bboxRight, bboxTop) ||
        tilemap_get_at_pixel(collisionMap, bboxLeft, bboxBottom) ||
        tilemap_get_at_pixel(collisionMap, bboxRight, bboxBottom)
    );
}


function PlayerAnimation()
{
    if (moveSpeed == 0)
    {
        image_speed = 0;
        image_index = 0;
    }
    else
    {
        image_speed = 1;
        if (inputDir != noone) {image_angle = inputDir}
    }
}

