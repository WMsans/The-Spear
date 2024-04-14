function scr_pos_in_string(pos_x, pos_y, text_x, text_y, text){
	//initially fa_top and fa_left
	return pos_x > text_x && pos_x < text_x + string_width(text) && pos_y > text_y && pos_y <text_y+string_height(text);
	
}