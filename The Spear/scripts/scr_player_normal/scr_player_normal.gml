function scr_player_normal(){
if(pre_hsp != -999) hsp = pre_hsp;
if(pre_vsp != -999) vsp = pre_vsp;
if(pre_bounced != -999) bounced = pre_bounced;
pre_hsp = -999; 
pre_vsp = -999;
pre_bounced = -999;

//veritcal movement & jump
vsp += grav;
if(jump_buffer > 0){
	jump_buffer -- ;
	if(key_jump_pressed_timer){
		bounced = false;
		jump_buffer = 0;
		vsp = jump_speed;
	}
}
if(vsp < 0 && !key_jump && !bounced){
	vsp = max(vsp, -1);
}
//horizontal movement

var dirh = key_right - key_left;

if((abs(hsp + dirh*accel) <= max_sp || (dirh != sign(hsp) && dirh != 0)) && !allow_move_timer) hsp += dirh*(accel);

if(dirh == 0 || abs(hsp) > bounced_max_sp )//
if(hsp < 0){
	hsp = min(hsp + decel, 0);
}else{
	hsp = max(hsp - decel, 0);
}



if(scr_touch_block(x + hsp, y)){//
	var one = sign(hsp);
	while(!scr_touch_block(x + one, y)){
		x += one;
	}
	hsp = 0;
}
x += hsp;

if(scr_touch_block(x, y + vsp)){
	var one = sign(vsp);
	while(!scr_touch_block(x , y + one)){
		y+= one;
	}
	vsp = 0;
}
vsp = clamp(vsp, -max_vsp, max_vsp);
y += vsp; 

if(scr_touch_block(x, y+ groundbuffer)){
	jump_buffer = 5;
	if(scr_touch_block(x + bbox_right - bbox_left, y + groundbuffer) && scr_touch_block(x - bbox_right + bbox_left, y + groundbuffer) ){
		global.nearest_x = x;
		global.nearest_y = y;
	}
}

if(hold_spear){
	if(!instance_exists(obj_spear)){
		instance_create(x,y,obj_spear);
	}
}



allow_move_timer = max(allow_move_timer -1, 0)
#region animation
sprite_index = spr_player;
if(abs(hsp) >= 1) image_xscale = sign(hsp);
if(abs(hsp) < 1 && abs(vsp) < 1 && anim_speed_timer % anim_speed_buff == 0){
	sprite_index = spr_player_idle;
	anim_speed_timer = 0;
}else{
	sprite_index = spr_player;
	anim_speed_timer++;
}

#endregion
}