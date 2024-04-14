function scr_loadgame(){
	ini_open("file0.sav");
	global.checkpoint_rm=ini_read_real("progress","room",rm_01);
	global.checkpoint_x=ini_read_real("progress","x",0);
	global.checkpoint_y=ini_read_real("progress","y",0);
	
	global.item_num=ini_read_real("item","num",0);
	global.backpacksize=ini_read_real("item","backpacksize",8);
	for(var i = 1;i <= global.item_num;i ++){
		global.item[i] = ini_read_real("item","item" + string(i),0);
	}
	
	global.charaskillnum = ini_read_real("progress","charaskillnum",0);
	for(var j=1;j<=global.charaskillnum;j++) global.charaskill[j] = ini_read_real("progress","charaskill"+string(j),0);
	global.charanowskill=ini_read_real("progress","charanowskill",1);
	
	global.gold = ini_read_real("progress","gold",0);
	global.plot = ini_read_real("progress","plot",0);
	ini_close();
	ini_open("setting.sav");
	global.keyup = ini_read_real("control","UP",vk_up);
	global.keyleft = ini_read_real("control","LEFT",vk_left);
	global.keyright = ini_read_real("control","RIGHT",vk_right);
	global.keydown = ini_read_real("control","DOWN",vk_down);
	global.keyz = ini_read_real("control","CONFIRM",ord("Z"));
	global.keyx = ini_read_real("control","CANCLE",ord("X"));
	global.keyc = ini_read_real("control","BACKPACK",ord("C"));
	global.keya = ini_read_real("control","SKILL",ord("A"));
	global.keyesc = ini_read_real("control","ESCAPE",vk_escape);
	global.keyshift = ini_read_real("control","SHIFT",vk_shift);
	global.keyctrl =  ini_read_real("control","CONTROL",vk_control);
	global.keyspace = ini_read_real("control","SPACE",vk_space);
	ini_close();
}