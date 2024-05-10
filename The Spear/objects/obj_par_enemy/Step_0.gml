/// @description 
event_inherited();

if(hp <= 0) instance_destroy();

if(place_meeting(x,y,obj_player)) global.hp -= attack;

if(flashalpha>0){
	flashalpha-=0.1;
}