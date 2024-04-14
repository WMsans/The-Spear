/// @description 
if(global.expecting_textblock_x==-999||global.expecting_textblock_y==-999||global.gamestate == game_states.cutscene){//Destroy the obj.
	image_xscale-=image_xscale/5;
	image_yscale-=image_yscale/5;
	if(image_xscale<=sub_scale||image_yscale<=sub_scale) instance_destroy();
}else{//Every thing is normal
	image_xscale+=(1-image_xscale)/5;
	image_yscale+=(1-image_yscale)/5;
	
	x+=(global.expecting_textblock_x-x)/3;
	y+=(global.expecting_textblock_y-y)/3;
	if(abs(fly_max-fly)>sub){
		fly+=(fly_max-fly)/20;
	}else{
		if(!timer--){
			if(fly_max==-16) fly_max=-8;
			else fly_max=-16;
			timer=gap;
		}
	}
}