///@arg x
///@arg y
function scr_touch_block(_x, _y){
	return place_meeting(_x, _y, obj_block) || place_meeting(_x, _y, obj_block_transparent)
}

///@arg x
///@arg y
function scr_place_block(_x, _y){
	var _id = instance_place(_x, _y, obj_block);
	if(_id == noone) _id = instance_place(_x, _y, obj_block_transparent);
	return _id; 
}

///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg prec
function scr_line_touch_block(_x1, _y1, _x2, _y2, _prec){
	var _ans = false;
	if(collision_line(_x1, _y1, _x2, _y2, obj_block, _prec, 1) != noone){
		_ans = true;
	}else if(collision_line(_x1, _y1, _x2, _y2, obj_block_transparent, _prec, 1) != noone){
		_ans = true;
	}
	return _ans;
}
