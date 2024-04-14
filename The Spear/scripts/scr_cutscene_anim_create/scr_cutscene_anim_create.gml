///@arg target
///@arg var_name
///@arg tween
///@arg ease
///@arg start
///@arg change
///@arg duration
///@arg delay*
///@arg arg_0*
///@arg arg_1*
function scr_cutscene_anim_create(){
	if(argument_count>=10) scr_anim_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
	else if(argument_count>=9) scr_anim_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
	else if(argument_count>=8) scr_anim_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
	else scr_anim_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
	scr_cutscene_end_action();
}