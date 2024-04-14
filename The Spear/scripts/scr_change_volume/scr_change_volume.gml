function scr_change_volume(){
	switch(menu_option[page]){
		case 0:
			audio_master_gain(argument[0]);
			break;
		case 1:
			audio_group_set_gain(audiogroup_snd,argument[0],0);
			break;
		case 2:
			audio_group_set_gain(audiogroup_mus,argument[0],0);
			break;
	}
}
function scr_change_volume_master(){
	audio_master_gain(argument[0]);
}
function scr_change_volume_music(){
	audio_group_set_gain(audiogroup_mus,argument[0],0);
}
function scr_change_volume_sound(){
	audio_group_set_gain(audiogroup_snd,argument[0],0);
}