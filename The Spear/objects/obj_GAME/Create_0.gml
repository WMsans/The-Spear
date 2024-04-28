/// @description 
scr_anim_init();
//load audio groups
if(!audio_group_is_loaded(audiogroup_mus)) audio_group_load(audiogroup_mus);
if(!audio_group_is_loaded(audiogroup_snd)) audio_group_load(audiogroup_snd);

//setting pause
pause_surf=-1;
pause_surfbuffer=-1;
resw=1280;
resh=720;

//Prev game states
pppgame_states = global.gamestate;

//mouse lock
window_mouse_set_locked(true);

