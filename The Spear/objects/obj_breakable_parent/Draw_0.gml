/// @description Draw Self and Effects
if(alpha = 0) { draw_self(); }

else if(alpha > 0) {
    var xs = x + irandom_range(-shake,shake);
    var ys = y + irandom_range(-shake,shake);
    
    draw_sprite_ext(sprite_index,image_index,xs,ys,image_xscale,image_yscale,image_angle,-1,1);
    if(flash) { draw_sprite_ext(sprite_index,image_index,xs,ys,image_xscale,image_yscale,image_angle,color,alpha); }
    
    alpha -= 0.05;
}

