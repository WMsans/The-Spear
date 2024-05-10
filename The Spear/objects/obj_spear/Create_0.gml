/// @description 
event_inherited();
enum SPEAR_STATES{
	normal, 
	poke,
	anchor,
	attack
}
spear_state = SPEAR_STATES.normal;
pre_spear_state = -999;
state_machine[SPEAR_STATES.normal] = scr_spear_normal;
state_machine[SPEAR_STATES.poke] = scr_spear_poke;
state_machine[SPEAR_STATES.anchor] = scr_spear_anchor;
state_machine[SPEAR_STATES.attack] = scr_spear_attack;

//block hit
hit_objs = ds_list_create();

//anchor
enum ANCHOR_FACE{
	left,
	top,
	bottom,
	right
}
anchor_x = 0;
anchor_y = 0;
anchor_face = 0;

max_spin_speed = 12;
spin_speed = 0;
spin_speed_up = 2;
spin_speed_down = 1;
last_dir = 0;

slash_time = 10;
slash_timer = 0;