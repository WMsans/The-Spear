/// @description Set up camera
cam=view_camera[0];
cam_speed=10;//lower is faster
follow=obj_player;
view_w_half=camera_get_view_width(cam)*0.5;
view_h_half=camera_get_view_height(cam)*0.5;

xTo=x;
yTo=y;
//Screen Shake
shake_length=0;
shake_magnitude=0;
shake_remain=0;

layer_shake_length=ds_list_create();
layer_shake_magnitude=ds_list_create();
layer_shake_remain=ds_list_create();
layer_shake_layer=ds_list_create();
buff=16;

hsp = 0;
vsp = 0;