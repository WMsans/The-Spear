/// @description 
current_scene = scene_info[scene];
var len = array_length(current_scene);
current_scene_array = array_create(len-1,0);
array_copy(current_scene_array,0,current_scene,1,len);