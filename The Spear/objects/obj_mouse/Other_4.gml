/// @description 

x -= prev_cam_x;
y -= prev_cam_y;

if(instance_exists(obj_camera)){
	x += obj_camera.x;
	y += obj_camera.y;
}else{
	x += view_w_half;
	y += view_h_half;
}