/// @description movement and gravity
x += xspeed;
y += yspeed;
yspeed += 0.1;
xspeed *= 0.99;

//fade and destroy
fade -= fade_rate;
if(fade <= 0) { instance_destroy(); }

//draw
draw_sprite_general(sprite_index,image_index,left,top,width,height,x,y,image_xscale,image_yscale,image_angle,-1,-1,-1,-1,fade);

