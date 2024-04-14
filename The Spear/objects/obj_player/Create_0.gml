/// @description 
event_inherited();

player_vision_in_dark = true;//create a lightsource following the player
#region state machine
enum PLAYER_STATES{
	normal,
	fight,
	skill,
	attack
}

player_state = PLAYER_STATES.normal;
state_machine[PLAYER_STATES.normal] = scr_player_normal;
state_machine[PLAYER_STATES.skill] = scr_player_skill;

#endregion
#region motion
hsp = 0;
vsp = 0;

grav = 1;
jump_speed = 0;
groundbuffer = 5;//when 3 pixel to the ground, allow jump
jump_speed = -24;
jump_buffer = 12;//frame after leaving ground when we can jump

accel = 1.5;
decel = 1.2;
max_sp = 8;
max_vsp = 20;

key_jump_pressed_timer = 0;
key_jump_pressed_buffer = 5;
#endregion
#region animation
initflag=1;
facing=-1;
anim_speed_buff = 10;
anim_speed_timer = 0;

flashalpha=0;
flashcolor=c_white;
#endregion
#region lighting
if(player_vision_in_dark && instance_exists(obj_lighting_init)){
	var charalight = instance_create_depth(x,y,depth,obj_characterlight);
	charalight.following_object = id;
}
#endregion