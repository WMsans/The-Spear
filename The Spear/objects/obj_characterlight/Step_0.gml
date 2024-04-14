/// @description move light with player
if(instance_exists(following_object)){
light[| eLight.X] = following_object.x;
light[| eLight.Y] = following_object.y;
}else{
	light[| eLight.X] =-999;
	light[| eLight.Y] =-999;
}
light[| eLight.Range]=lightrange;
light[| eLight.Flags] |= eLightFlags.Dirty;

lightrange+=lightspeed;