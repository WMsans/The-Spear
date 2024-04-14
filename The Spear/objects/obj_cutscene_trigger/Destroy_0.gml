/// @description Delete same type of trigger
var _id=id;
var _tmp_type=tmp_type;
with(obj_cutscene_trigger){
	if(id!=_id&&tmp_type!=0){
		if(tmp_type==_tmp_type){
			instance_destroy();
		}
	}
}