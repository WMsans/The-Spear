///@arg obj
///@arg tarx
///@arg tary
///@arg relative?
///@arg speed
function scr_cutscene_move_chara(_obj,_tarx,_tary,_relative,_spd){
	if(x_dest==-1){//初始化tarx
		if(!_relative){//不是相对坐标
			x_dest=_tarx;
			y_dest=_tary;
		}else{
			x_dest=_obj.x+_tarx;
			y_dest=_obj.y+_tary;
		}
	}
	var xx=x_dest;
	var yy=y_dest;
	
	with(_obj){
		var dir=point_direction(x,y,xx,yy);
		var ldirx=lengthdir_x(_spd,dir);
		var ldiry=lengthdir_y(_spd,dir);
		if(point_distance(x,y,xx,yy) >= _spd){
			x+=ldirx;
			y+=ldiry;
			if(ldirx!=0&&ldiry==0) _facing=sign(ldirx)*2;
			else if(ldiry!=0&&ldirx==0) _facing=0-sign(ldiry);
			else if(abs(ldirx)>abs(ldiry)) _facing=sign(ldirx)*2;
			else _facing=0-sign(ldiry);
			
			//animate sprite
			#region sprite animation
			var _name=object_get_name(object_index );
			if(_name=="obj_player"){
				if(ldirx !=0) image_xscale = sign(ldirx);
				if(ldirx==0&&ldiry==0){//player stay still
					image_index = 1;
				}else{//player is moving
					image_speed=1;
				}
			}
			#endregion
		}else{
			//animate sprite
			var _name=object_get_name(object_index);
			if(_name=="obj_player"){
				if(ldirx != 0) image_xscale = sign(ldirx);
			}
			x=xx; y=yy;
			with(other){
				x_dest=-1; y_dest=-1;
				scr_cutscene_end_action();
			}
		}
	}
}