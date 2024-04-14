function scr_portrait_decision(){
	if(argument[0] != undefined){
		speaker_spr[page_num] = argument[0];
	}
	if(argument[1] != undefined){
		snd[page_num] = argument[1];
	}
	if(argument[2] != undefined){
		txtb_spr[page_num] = argument[2];
	}
}