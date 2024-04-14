function scr_create_menu_page(){
	var arg;
	for(var i=0;i<argument_count;i++){
		arg[i]=argument[i];
	}
	var ds_grid_id=ds_grid_create(5,argument_count);
	for(var i=0;i<argument_count;i++){
		var array=arg[i];
		var array_len=array_length_1d(array);
		
		for(var xx=0;xx<array_len;xx++){
			ds_grid_id[# xx,i]=array[xx];
			
		}
	}
	return ds_grid_id;
}