function scr_breakable_hit(_hp = 1){
	if(hp != -1){
		hp -= _hp;
		alpha = 1; //start effect

		///Breaking
		if(hp <= 0) {

		    switch(type) {
		    case 0: //No effect.
		        instance_destroy();
		        break;

		    case 1: //Break into Chunks
		        var sw = (sprite_width /2) /image_xscale;
		        var sh = (sprite_height /2) /image_yscale;
		        repeat(chunks) {
		            with(instance_create(x,y,obj_breakable_chunk)) {
		                sprite_index = other.sprite_index;
		                image_index  = other.image_index;
		                image_xscale = other.image_xscale;
		                image_yscale = other.image_yscale;
		                image_angle = irandom(360);
		                left = irandom(sw);
		                top = irandom(sh);
		                width = irandom(sw);
		                height = irandom(sh);
		                //control the speed / direction chunks burst
		                xspeed = random_range(-1.25,1.25);
		                yspeed = random_range(0,-2.5);
		            }
		        }
		        instance_destroy();
		        break;

		    //case 2: "You can make custom effects here!" break;
		    }

		}
	}

}