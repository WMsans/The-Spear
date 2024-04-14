/// @description 
if(fadeout){
	a=min(a+fadeoutrate,1);
	if(a==1) room_goto(target_room);
} else{
	a=max(a-fadeinrate,0);
	if(a==0) instance_destroy();
}
