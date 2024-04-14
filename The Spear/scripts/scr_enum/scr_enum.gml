function scr_enum(){
	enum game_states{
		init,
		button,
		cutscene,
		setting,
		item,
		skill_setting,
		saving,
	}
	enum layers{
		overworld = 0,
		lighting = -100,
		buttons = -200,
		UI = -300,
		setting = -400,
		cursor = -500,
		fade = -600
	}
	enum Input_State{
		keep, 
		pressed,
		released,
		null,
	}
}