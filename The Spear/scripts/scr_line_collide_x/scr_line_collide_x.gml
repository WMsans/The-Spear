function scr_line_collide_segment(x1,y1,x2,y2,x3,y3,x4,y4){
	return scr_cross_product(x3 - x1, y3 - y1, x2 - x1, y2 - y1) * scr_cross_product(x4 - x1, y4 - y1, x2- x1, y2 - y1) <= 0;
}
function scr_segment_collide(x1,y1,x2,y2,x3,y3,x4,y4){
	return scr_line_collide_segment(x3,y3,x4,y4, x1,y1,x2,y2) && scr_line_collide_segment(x1,y1,x2,y2,x3,y3,x4,y4)
}
function scr_segment_collide_x(x1,y1,x2,y2,x3,y3,x4,y4){
	if(!scr_segment_collide(x1,y1,x2,y2,x3,y3,x4,y4)) return -999;
	return -1 * ((x1 - x2) * (x3 * y4 - x4 * y3) - (x4 - x3) * (x2 * y1 - x1 * y2)) / ((y3 - y4) * (x1 - x2) - (x4 - x3) * (y2 - y1))
}
function scr_segment_collide_y(x1,y1,x2,y2,u1,v1,u2,v2){
	if(!scr_segment_collide(x1,y1,x2,y2,u1,v1,u2,v2)) return -999;
	return  -1 * (u1 * v2 * y1 - u1 * v2 * y2 - u2 * v1 * y1 + u2 * v1 * y2 - v1 * x1 * y2 + v1 * x2 * y1 + v2 * x1 * y2 - v2 * x2 * y1) / (-1 * u1 * y1 + u1 * y2 + u2 * y1 - u2 * y2 + v1 * x1 - v1 * x2 - v2 * x1 + v2 * x2);
}

function scr_line_collide(x1,y1,x2,y2,x3,y3,x4,y4){
	return abs((y2 - y1) / (x2 - x1) - (y4 - y3) / (x4 - x3)) > 1;
}
function scr_line_collide_x(x1,y1,x2,y2,x3,y3,x4,y4){
	if(!scr_line_collide(x1,y1,x2,y2,x3,y3,x4,y4)) return -999;
	return ((x3-x4) * (x2*y1 - x1*y2) - (x1-x2) * (x4*y3 - x3*y4)) / ((x3-x4) * (y1-y2) - (x1-x2) * (y3-y4));
}
function scr_line_collide_y(x1,y1,x2,y2,x3,y3,x4,y4){
	if(!scr_line_collide(x1,y1,x2,y2,x3,y3,x4,y4)) return -999;
	return ((y3-y4) * (y2*x1 - y1*x2) - (y1-y2) * (y4*x3 - y3*x4)) / ((y3-y4) * (x1-x2) - (y1-y2) * (x3-x4));
}