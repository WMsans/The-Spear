function scr_spear_attack(){
	slash_timer = slash_time;
	//change sprite
	if(sprite_index != spr_spear_attack){
		sprite_index = spr_spear_attack;
		image_index = 0;
	}
	if(instance_exists(obj_player)){
		if(abs(obj_player.hsp) < 1) obj_player.image_xscale = sign(scr_get_spear_head_x() - x);
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
				event_user(1);
			}
		}
	}
	ds_list_destroy(hitbyattacknow); 
	//结束动画时结束攻击
	if(scr_animation_end()){
		spear_state = SPEAR_STATES.normal;
	}
}