function scr_resetgame(){
	if(file_exists("file0.sav")) file_delete("file0.sav");
	scr_loadgame();
}