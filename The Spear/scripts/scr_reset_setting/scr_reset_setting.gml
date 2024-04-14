function scr_reset_setting(){
	show_debug_message("restored");
	if(file_exists("setting.sav")){
		file_delete("setting.sav");
	}
	ds_menu_main=scr_create_menu_page(
		["Resume",element_type.script_runner,scr_menu_resume],
		["Audio",element_type.page_transfer,pages.audio],
		["Graphics",element_type.page_transfer,pages.graphics],
		["Controls",element_type.page_transfer,pages.controls],
		["Restore to Default", element_type.script_runner, scr_reset_setting],
		["Back to title",element_type.script_runner,scr_rmgoto_title]
	);
	ds_audio=scr_create_menu_page(
		["Master",element_type.slider,scr_change_volume_master,0.75,[0,1]],
		["Sounds",element_type.slider,scr_change_volume_sound,1,[0,1]],
		["Music",element_type.slider,scr_change_volume_music,1,[0,1]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_graphic=scr_create_menu_page(
		["Full Screen",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_control = scr_create_menu_page(
		["Mouse Sensitivity",		element_type.slider,		scr_change_mouse_sensitivity,1,[0,3]],
		["UP",			element_type.input,			"keyup",				vk_up],
		["LEFT",		element_type.input,			"keyleft",  			vk_left],
		["RIGHT",		element_type.input,			"keyright",				vk_right],
		["DOWN",		element_type.input,			"keydown",				vk_down],
		["CONFIRM",		element_type.input,			"keyz",					ord("Z")],
		["CANCLE",		element_type.input,			"keyx",					ord("X")],
		["BACKPACK",	element_type.input,			"keyc",					ord("C")],
		["SKILL",		element_type.input,			"keya",					ord("A")],
		["ESCAPE",		element_type.input,			"keyesc",				vk_escape],
		["WALK",		element_type.input,			"keyshift",				vk_shift],
		["CONTROL",		element_type.input,			"keyctrl",				vk_control],
		["SPACE",		element_type.input,			"keyspace",				vk_space],
		["Back",		element_type.page_transfer,	pages.main],
	);
	page=0;
	ds_menu_pages=[ds_menu_main,ds_audio,ds_graphic,ds_control];
	for(var _pg = page; _pg < array_length_1d(ds_menu_pages); _pg++){
		var ds_grid=ds_menu_pages[_pg],ds_height=ds_grid_height(ds_grid);
		for(var pos = 0; pos < ds_height; pos++){
			switch(ds_grid[# 1,pos]){
				case element_type.input:
					var kk = ds_grid[# 3, pos];
					variable_global_set(ds_grid[# 2, pos], kk);
					break;
				case element_type.shift:
				case element_type.slider:
				case element_type.toggle:
					script_execute(ds_grid[# 2,pos],ds_grid[# 3, pos]);
					break;
			}
		}
		
	}
}