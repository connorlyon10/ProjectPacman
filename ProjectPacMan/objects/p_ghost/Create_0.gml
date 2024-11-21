///@desc Inits for all ghosts

//Sets walls to be collidable
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));


speed = 0.1;
direction = choose(0,90,180,270)