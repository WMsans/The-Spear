function scr_create_text(_text_id){
	with(instance_create_depth(x,y,layers.UI,obj_textbox)){
		scr_game_txt(_text_id);
		
		if(argument_count>1){
			camx=argument[1];
			camy=argument[2];
		}else{
			camx=obj_camera.x;
			camy=obj_camera.y;
		}
		
	}
}