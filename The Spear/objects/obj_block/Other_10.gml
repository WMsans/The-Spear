/// @description 
if(instance_exists(obj_spear)){
	if(!collision_line(obj_spear.x, obj_spear.y, scr_get_spear_head_x(), scr_get_spear_head_y(), id, false, false)) exit;
	
	var _x1 = [bbox_left, bbox_left, bbox_left, bbox_right];
	var _y1 = [bbox_top, bbox_top, bbox_bottom, bbox_top];
	var _x2 = [bbox_left, bbox_right, bbox_right, bbox_right];
	var _y2 = [bbox_bottom, bbox_top, bbox_bottom, bbox_bottom];
	
	var anchor_on_edge = false;
	var _mindis = point_distance(obj_spear.anchor_x,obj_spear.anchor_y, obj_spear.x, obj_spear.y);
	for(var i = 0;i < 4;i ++){
		var __x1 = _x1[i], __y1 = _y1[i], __x2 = _x2[i], __y2 = _y2[i];
		if(!scr_segment_collide(__x1, __y1, __x2, __y2, obj_spear.x, obj_spear.y, scr_get_spear_head_x(), scr_get_spear_head_y())) continue;
		
		var _anchor_x = scr_segment_collide_x(__x1, __y1, __x2, __y2, obj_spear.x, obj_spear.y, scr_get_spear_head_x(), scr_get_spear_head_y());
		var _anchor_y = scr_segment_collide_y(__x1, __y1, __x2, __y2, obj_spear.x, obj_spear.y, scr_get_spear_head_x(), scr_get_spear_head_y());
		if(_mindis > point_distance(_anchor_x,_anchor_y, obj_spear.x, obj_spear.y)){
			anchor_on_edge = true;
			obj_spear.anchor_x = _anchor_x;
			obj_spear.anchor_y = _anchor_y;
			obj_spear.anchor_face = i;
			_mindis = point_distance(_anchor_x,_anchor_y, obj_spear.x, obj_spear.y);
		}
	}
	
	if(anchor_on_edge){
		
		obj_spear.pre_spear_state = SPEAR_STATES.anchor;
	}
}

