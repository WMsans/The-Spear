/// @description 
var i=0,array_len=array_length(ds_menu_pages);
repeat(array_len){
	ds_grid_destroy(ds_menu_pages[i]);
	i++;
}
