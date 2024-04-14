/// @description 
allow_move = false;

box_w=992;
border=32;
line_sep=48;
line_w=box_w-border*2;

camx=0;
camy=0;
_camx=obj_camera.x;
_camy=obj_camera.y;

//txtb_spr[0]=spr_chatbox_init2;
txtb_img=0;
txtb_img_spd=10/60;

page=0;
page_num=0;
text[0]="";
/*
text[0]="Hello!";
text[1]="This is the auther speaking!"
text[2]="I'm thinking about...Eh,I forget ;)"
*/
text_len[0]=string_length(text[0]);
draw_char=0;
text_spd=1;

char[0][0]="";
char_x[0][0]=0;
char_y[0][0]=0;


//options
chosing=0;
print_op=false;
option[0]="";
option_link_id[0]=-1;
option_pos=0;
option_num=0;
option_color[0]=c_white;

setup=0;

//effects
scr_text_set_init();
last_free_space=0;

text_pause_timer=0;
text_pause_time=16;

sound_delay=4;
sound_ct=sound_delay;

pressingz=1;
savebox=0;

mouse_delth = 0;
mouse_deltv = 0;
