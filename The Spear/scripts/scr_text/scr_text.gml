///@arg text
///@arg portrait
///@arg snd
///@arg textbox texture
///@arg dir
function scr_text(_text, _portrait = undefined, _snd = undefined, _textbox = undefined){
	
	text[page_num]=_text;
	scr_text_set_init();
	
	scr_portrait_decision(_portrait,_snd,_textbox);
	
	if(argument_count>4) speaker_side[page_num]=argument[4];
	
	page_num++;
}
