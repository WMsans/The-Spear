function scr_savegame(){
	ini_open("file0.sav");
	ini_write_real("progress","room", global.checkpoint_rm);
	ini_write_real("progress","x", global.checkpoint_x);
	ini_write_real("progress","y", global.checkpoint_y);
	
	ini_write_real("item","num", global.item_num);
	ini_write_real("item","backpacksize", global.backpacksize);
	for(var i = 1;i <= global.item_num;i ++){
		ini_write_real("item","item" + string(i), global.item[i]);
	}
	
	ini_write_real("progress","charaskillnum", global.charaskillnum);
	
	for(var j=1;j<=global.charaskillnum;j++) ini_write_real("progress","charaskill"+string(j), global.charaskill[j]);
	ini_write_real("progress","charanowskill", global.charanowskill);
	
	ini_write_real("progress","gold", global.gold);
	ini_write_real("progress","plot", global.plot);
	
	ini_write_real("progress","max_hp", global.max_hp);
	ini_write_real("progress","attack", global.attack);
	ini_close();
}