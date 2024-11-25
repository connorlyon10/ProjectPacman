/// @description Send player to other side of room


with obj_pacman
{
	x = other.LocationX
	y = other.LocationY;
	direction = direction + 180;
}