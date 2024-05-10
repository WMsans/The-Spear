function scr_reset_setting(){
	show_debug_message("restored");
	if(file_exists("setting.sav")){
		file_delete("setting.sav");
	}
	scr_load_setting();
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