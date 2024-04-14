function scr_anim_init(){
	//GMU_Anim v3.0.0

	global._gmu_anim_list=ds_list_create();
	global._gmu_anim_data=ds_map_create();
	global._gmu_anim_id=-10;

	enum ANIM_TWEEN{
		LINEAR,//线性
		SINE,//速度成正弦增长
		QUAD,//速度成2次方增长
		CUBIC,//速度成3次方增长
		QUART,//速度成4次方增长
		QUINT,//速度成5次方增长
		EXPO,//速度成指数增长
		CIRC,//不知道qwq
		BACK,//回旋一段再线性前往目标
		ELASTIC,//来回回旋很多次
		BOUNCE//以起始点为“地面”，弹过去...
	};

	enum ANIM_EASE{
		IN,//动态曲线正常
		OUT,//动态曲线反转
		IN_OUT//动态曲线在中间
	};

	enum ANIM_DATA{
		TARGET,
		VAR_NAME,
		TWEEN,
		EASE,
		START,
		CHANGE,
		DURATION,
		DELAY,
		ARG_0,
		ARG_1,
		TIME
	};


}