/// @description Recenter the mouse
if((instance_exists(obj_camera) && distance_to_object(obj_camera) > 5000) || (!instance_exists(obj_camera) && distance_to_point(684,360) > 5000)){
	if(instance_exists(obj_camera)){
		x = obj_camera.x;
		y = obj_camera.y;
	}else{
		x = 684;
		y = 360;
	}
}