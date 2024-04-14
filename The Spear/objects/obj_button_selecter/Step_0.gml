/// @description 
if(global.gamestate == game_states.button){
	if(now_selecting = noone){//randomly select one
		now_selecting_array_y = button_groups_by_y[? ds_map_find_first(button_groups_by_y)];
		if(now_selecting_array_y != undefined){
		now_selecting = now_selecting_array_y[array_length(now_selecting_array_y)-1];
		now_selecting_array_x = button_groups_by_x[? now_selecting.button_group];
		}
	}else{
	#region button selection
	if(input_check(global.keyup, 1)){
		now_selecting.selected = false;
		var len = array_length(now_selecting_array_y);
		var pre_selected = noone;
		var flag = false;
		for(var i = (array_get_index(now_selecting_array_y, now_selecting) + 1) % len; now_selecting_array_y[i] != now_selecting; i = (i+1) % len){
			if(!flag && abs(now_selecting_array_y[i].y - now_selecting.y) > 0.5){
				flag = true;
				pre_selected = now_selecting_array_y[i];
			}
			if(flag){
				if(abs(now_selecting_array_y[i].y - pre_selected.y) > 0.5) break;
				if(scr_get_instance_distance(pre_selected, now_selecting) > scr_get_instance_distance(now_selecting_array_y[i], now_selecting)){
					pre_selected = now_selecting_array_y[i];
				}
			}
		}
		if(pre_selected == noone){//都在同一行
			pre_selected = now_selecting_array_x[(array_get_index(now_selecting_array_x, now_selecting) - 1) < 0 ? array_length(now_selecting_array_x)-1 : (array_get_index(now_selecting_array_x, now_selecting) - 1)];
		}
		now_selecting = pre_selected;
	}
	if(input_check(global.keydown, 1)){
		now_selecting.selected = false;
		var len = array_length(now_selecting_array_y);
		var pre_selected = noone;
		var flag = false;
		for(var i = array_get_index(now_selecting_array_y, now_selecting) - 1 < 0 ? len-1 : array_get_index(now_selecting_array_y, now_selecting) - 1; now_selecting_array_y[i] != now_selecting; i = i-1 < 0 ? len-1 : i-1){
			if(!flag && abs(now_selecting_array_y[i].y - now_selecting.y) > 0.5){
				flag = true;
				pre_selected = now_selecting_array_y[i];
			}
			if(flag){
				if(abs(now_selecting_array_y[i].y - pre_selected.y) > 0.5) break;
				if(scr_get_instance_distance(pre_selected, now_selecting) > scr_get_instance_distance(now_selecting_array_y[i], now_selecting)){
					pre_selected = now_selecting_array_y[i];
				}
			}
		}
		if(pre_selected == noone){//都在同一行
			now_selecting = now_selecting_array_x[(array_get_index(now_selecting_array_x, now_selecting) + 1) % array_length(now_selecting_array_x)];
		}
		now_selecting = pre_selected;
	}
	if(input_check(global.keyleft, 1)){
		now_selecting.selected = false;
		var len = array_length(now_selecting_array_x);
		var pre_selected = noone;
		var flag = false;
		for(var i = (array_get_index(now_selecting_array_x, now_selecting) + 1) % len; now_selecting_array_x[i] != now_selecting; i = (i+1) % len){
			if(!flag && abs(now_selecting_array_x[i].x - now_selecting.x) > 1){
				flag = true;
				pre_selected = now_selecting_array_x[i];
			}
			if(flag){
				if(abs(now_selecting_array_x[i].x - pre_selected.x) > 1) break;
				if(scr_get_instance_distance(pre_selected, now_selecting) > scr_get_instance_distance(now_selecting_array_x[i], now_selecting)){
					pre_selected = now_selecting_array_x[i];
				}
			}
		}
		if(pre_selected == noone){//都在同一列
			pre_selected = now_selecting ;//now_selecting_array_y[(array_get_index(now_selecting_array_y, now_selecting) - 1) < 0 ? array_length(now_selecting_array_y)-1 : (array_get_index(now_selecting_array_y, now_selecting) - 1)]
		}
		now_selecting = pre_selected;
	}
	if(input_check(global.keyright, 1)){
		now_selecting.selected = false;
		var len = array_length(now_selecting_array_x);
		var pre_selected = noone;
		var flag = false;
		for(var i = array_get_index(now_selecting_array_x, now_selecting) - 1 < 0 ? len-1 : array_get_index(now_selecting_array_x, now_selecting) - 1; now_selecting_array_x[i] != now_selecting; i = i-1 < 0 ? len-1 : i-1){
			if(!flag && abs(now_selecting_array_x[i].x - now_selecting.x) > 0.5){
				flag = true;
				pre_selected = now_selecting_array_x[i];
			}
			if(flag){
				if(abs(now_selecting_array_x[i].x - pre_selected.x) > 0.5) break;
				if(scr_get_instance_distance(pre_selected, now_selecting) > scr_get_instance_distance(now_selecting_array_x[i], now_selecting)){
					pre_selected = now_selecting_array_x[i];
				}
			}
		}
		if(pre_selected == noone){//都在同一行
			pre_selected = now_selecting;//now_selecting_array_y[(array_get_index(now_selecting_array_y, now_selecting) + 1) % array_length(now_selecting_array_y)]
		}
		now_selecting = pre_selected;
	}
	now_selecting.selected = true;
	#endregion
	#region arrow animation
	tar_dir = (now_selecting.arrow_placement+1) % 4 * -90;
	var dirx = [1, 0, -1 , 0];
	var diry = [0, 1, 0, -1];
	tar_x = now_selecting.x + dirx[now_selecting.arrow_placement] * (now_selecting.sprite_width/2 + 20);
	tar_y = now_selecting.y + diry[now_selecting.arrow_placement] * (now_selecting.sprite_height/2 + 20);
	#endregion
	
	if(input_check(global.keyz, 1)){
		with(now_selecting){
			event_user(0);
		}
	}
	}
}else instance_destroy();


x += (tar_x - x) * moving_speed;
y += (tar_y - y) * moving_speed;
image_angle += (tar_dir - image_angle) * moving_speed;

