/// @description 
event_inherited();
enum SPEAR_STATES{
	normal, 
	poke,
	anchor
}
spear_state = SPEAR_STATES.normal;
state_machine[SPEAR_STATES.normal] = scr_spear_normal;
state_machine[SPEAR_STATES.poke] = scr_spear_poke;
state_machine[SPEAR_STATES.anchor] = scr_spear_anchor;

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

spin_speed =10;