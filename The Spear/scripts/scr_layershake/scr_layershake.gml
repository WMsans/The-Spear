///@desc scr_layershake(magnitude,frames);
///@param {integer} Magnitude
///@param {integer} Frames
///@param {string} Layer
function scr_layershake(magnitude,frames,_layer){
	with (obj_camera){
		if (magnitude > shake_remain) {
			ds_list_add(layer_shake_magnitude,magnitude);
			ds_list_add(layer_shake_remain,magnitude);
			ds_list_add(layer_shake_length,frames);
			ds_list_add(layer_shake_layer,_layer);
		}
	}
}