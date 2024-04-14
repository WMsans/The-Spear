///@arg 0 is fullscreen, 1 is window
function scr_fullscreen(_i){
	switch(_i){
		case 0:
			window_set_fullscreen(1);
			break;
		case 1:
			window_set_fullscreen(0);
			break;
		
	}
}