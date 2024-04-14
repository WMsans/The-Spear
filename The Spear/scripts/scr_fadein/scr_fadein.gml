///@arg fadein object
///@arg fadeinrate
function scr_fadein(_fade_object = obj_fade){
	if(_fade_object == noone) _fade_object = obj_fade;
	if(!instance_exists(_fade_object)){
		if(argument_count==2) {
			with(instance_create_depth(0,0,layers.fade,_fade_object)){
				fadeinrate=argument0;
			}
		} else instance_create_depth(0,0,layers.fade,_fade_object);
	}else{
		_fade_object.fadeout=0; 
		
		if(argument_count == 2){
			_fade_object.fadeinrate=argument0;
		}
	}
	global.fade_object = noone;
}