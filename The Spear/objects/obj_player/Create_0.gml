/// @description 
event_inherited();

player_vision_in_dark = true;//create a lightsource following the player
hold_spear = true;
#region state machine
enum PLAYER_STATES{
	normal,
	fight,
	skill,
	attack,
	anchor
}

player_state = PLAYER_STATES.normal;
state_machine[PLAYER_STATES.normal] = scr_player_normal;
state_machine[PLAYER_STATES.skill] = scr_player_skill;
state_machine[PLAYER_STATES.anchor] = scr_player_anchor;

#endregion
#region motion
hsp = 0;
vsp = 0;

grav = GRAVITY;
groundbuffer = 5;//when 5 pixel to the ground, allow jump
jump_speed = -18;
jump_buffer = 5;//frame after leaving ground when we can jump
bounced = false;//if the player can de-jump by release space

accel = 1.5;
decel = 1.2;
max_sp = 8;
max_vsp = 24;
allow_move_timer = 0;

key_jump_pressed_timer = 0;
key_jump_pressed_buffer = 8;
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