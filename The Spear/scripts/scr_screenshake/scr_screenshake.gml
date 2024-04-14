///@desc scr_screenshake(magnitude,frames);
///@param {integer} Magnitude
///@param {integer} Frames
function scr_screenshake(magnitude,frames){
	with (obj_camera){
		if (magnitude > shake_remain) {
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}