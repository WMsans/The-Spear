function scr_load_setting(){
	if(file_exists("setting.sav")){
		ini_open("setting.sav");
		ds_menu_main=scr_create_menu_page(
			["Resume",element_type.script_runner,scr_menu_resume],
			["Audio",element_type.page_transfer,pages.audio],
			["Graphics",element_type.page_transfer,pages.graphics],
			["Controls",element_type.page_transfer,pages.controls],
			["Restore to Default", element_type.script_runner, scr_reset_setting],
			["Back to title",element_type.script_runner,scr_rmgoto_title]
		);
		ds_audio=scr_create_menu_page(
			["Master",element_type.slider,scr_change_volume_master,ini_read_real("audio","Master",0.75),[0,1]],
			["Sounds",element_type.slider,scr_change_volume_sound,ini_read_real("audio","Sounds",1),[0,1]],
			["Music",element_type.slider,scr_change_volume_music,ini_read_real("audio","Music",1),[0,1]],
			["Back",element_type.page_transfer,pages.main]
		);
		ds_graphic=scr_create_menu_page(
			["Full Screen",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
			["Back",element_type.page_transfer,pages.main]
		);
		ds_control = scr_create_menu_page(
			["Mouse Sensitivity",		element_type.slider,		scr_change_mouse_sensitivity,ini_read_real("control","mouse_sensitivity",1),[0,3]],
			["UP",			element_type.input,			"keyup",				ini_read_real("control","UP",vk_up)],
			["LEFT",		element_type.input,			"keyleft",  			ini_read_real("control","LEFT",vk_left)],
			["RIGHT",		element_type.input,			"keyright",	     		ini_read_real("control","RIGHT",vk_right)],
			["DOWN",		element_type.input,			"keydown",				ini_read_real("control","DOWN",vk_down)],
			["CONFIRM",		element_type.input,			"keyz",					ini_read_real("control","CONFIRM",ord("Z"))],
			["CANCLE",		element_type.input,			"keyx",					ini_read_real("control","CANCLE",ord("X"))],
			["BACKPACK",	element_type.input,			"keyc",					ini_read_real("control","BACKPACK",ord("C"))],
			["SKILL",		element_type.input,			"keya",					ini_read_real("control","SKILL",ord("A"))],
			["ESCAPE",		element_type.input,			"keyesc",				ini_read_real("control","ESCAPE",vk_escape)],
			["WALK",		element_type.input,			"keyshift",				ini_read_real("control","SHIFT",vk_shift)],
			["RUN",			element_type.input,			"keyctrl",				ini_read_real("control","CONTROL",vk_control)],
			["SPACE",		element_type.input,			"keyspace",				ini_read_real("control","SPACE",vk_space)],
			["Back",		element_type.page_transfer,	pages.main],
		);
		ini_close();
		page=0;
		ds_menu_pages=[ds_menu_main,ds_audio,ds_graphic,ds_control];
	}else{
		scr_reset_setting();
	}
}