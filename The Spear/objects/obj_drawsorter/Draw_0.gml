/// @description 
//Resize grid
var dgrid=ds_depthgrid;
var inst_num=instance_number(obj_par_depthobj);
ds_grid_resize(dgrid,2,inst_num);

//add inst info
var yy=0; with(obj_par_depthobj){
	dgrid[# 0,yy]=id;
	dgrid[# 1,yy]=y+z;
	yy++;
}

//sort grid as ascending order
ds_grid_sort(dgrid,1,true);

//loop through the instances and draw them
var now_inst=noone;
for(yy=0; yy<inst_num; yy++){
	now_inst=dgrid[# 0, yy];
	with(now_inst){
		if(actually_showing||global.debug) event_perform(ev_draw,0);
	}
}
