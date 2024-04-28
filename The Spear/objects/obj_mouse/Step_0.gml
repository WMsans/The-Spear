/// @description 
var cam_hsp = 0;
var cam_vsp = 0;
if(instance_exists(obj_camera)){
	cam_hsp = obj_camera.hsp;
	cam_vsp = obj_camera.vsp;
}
x += scr_mouse_deltx() + cam_hsp;
y += scr_mouse_delty() + cam_vsp;

