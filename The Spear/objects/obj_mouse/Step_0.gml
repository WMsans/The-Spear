/// @description 
var cam_hsp = 0;
var cam_vsp = 0;
if(instance_exists(obj_camera)){
	cam_hsp = obj_camera.hsp;
	cam_vsp = obj_camera.vsp;
	if(instance_exists(obj_fade) && obj_fade.fadeout){
		prev_cam_x = obj_camera.x;
		prev_cam_y = obj_camera.y;
	}
	/*else if(prev_cam_x != -999 || prev_cam_y != -999){
		x += obj_camera.x - prev_cam_x;
		y += obj_camera.y - prev_cam_y;
		prev_cam_x = prev_cam_y = -999;
	}*/
}
if(point_distance(0,0,scr_mouse_deltx(),scr_mouse_delty()) > 1){
	visible = true;
}
x += scr_mouse_deltx() + cam_hsp;
y += scr_mouse_delty() + cam_vsp;

