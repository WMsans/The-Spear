function input_check(input, state){
	var _ans = false;
	var _mouse = false;
	if(input == mb_left || input == mb_right || input == mb_middle) _mouse = true;
	if(state == Input_State.keep){
		if(_mouse){
			if(mouse_check_button(input)) _ans = true;
		}else if(keyboard_check(input)){
			_ans = true;
		}
	}else if(state == Input_State.pressed){
		if(_mouse){
			if(mouse_check_button_pressed(input)) _ans = true;
		}else if(keyboard_check_pressed(input)){
			_ans = true;
		}
	}else if(state == Input_State.released){
		if(_mouse){
			if(mouse_check_button_released(input)) _ans = true;
		}else if(keyboard_check_released(input)){
			_ans = true;
		}
	}else if(state == Input_State.null){
		if(_mouse){
			if(!mouse_check_button(input) && !mouse_check_button_pressed(input) && !mouse_check_button_released(input)) 
				_ans = true;
		}else if(!keyboard_check(input) && !keyboard_check_pressed(input) && !keyboard_check_released(input)){
			_ans = true;
		}
	}
	
	return _ans;
}
