///@function scr_fadeout(target room);To fade to another room
///@param {index) _targetroom
///@param {integer} _target_x
///@param {integer} _target_y
///@param {index} _fade_object
function scr_fadeout(_targetroom,_target_x,_target_y, _fade_object = obj_fade){
	global.target_x=_target_x;
	global.target_y=_target_y;
	
	with(instance_create_depth(0,0,layers.fade,_fade_object)){
		a=0;
		fadeout=1;
		target_room=_targetroom;
	}
	
}