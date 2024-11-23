/// @description Inits
moveSpeed = 1
moveX = 0;
moveY = 0;
inputDir = 180;
currentDir = inputDir;


//Gets collidable surfaces - see 'collisionMap' in PlayerCollision()
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
