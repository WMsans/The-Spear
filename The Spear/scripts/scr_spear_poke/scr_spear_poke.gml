function scr_spear_poke(){
	anchor_x = -999;
	anchor_y = -999;
	//change sprite
	if(sprite_index != spr_spear_poke){
		sprite_index = spr_spear_poke;
		image_index = 0;
	}
	//跟随玩家
	if(!instance_exists(obj_player)){
		instance_destroy();
	}else{
		x = obj_player.x;
		y = obj_player.y;
	}
	//跟随鼠标
	if(instance_exists(obj_mouse)){
		image_angle = point_direction(x,y,obj_mouse.x,obj_mouse.y);
	}
	//攻击物体
	var hitbyattacknow=ds_list_create();
	var hits=instance_place_list(x,y,obj_par_depthobj,hitbyattacknow,false);
	for(var i=0;i<hits;i++){
		var hitid = hitbyattacknow[| i];
		if(ds_list_find_index(hit_objs, hitid)==-1){
			ds_list_add(hit_objs, hitid);
			with(hitid){//被砍的敌人做什么
				event_user(0);
			}
		}
	}
	ds_list_destroy(hitbyattacknow); 
	if(!ds_list_empty(hit_objs)) ds_list_clear(hit_objs);
	if(pre_spear_state != -999){
		spear_state = pre_spear_state;
		pre_spear_state = -999;
		spin_speed = 0;
	}
	//结束动画时结束攻击
	if(image_index == image_number - 1){
		image_speed = 0;
		image_index = image_number - 1;
		if(!key_poke){
			spear_state = SPEAR_STATES.normal;
		}
		//if(spear_state == SPEAR_STATES.poke) spear_state = SPEAR_STATES.normal;
	}
	
}