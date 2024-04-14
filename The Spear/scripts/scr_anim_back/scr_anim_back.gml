function scr_anim_back(_id,value,start,target,time,delay){
	scr_anim_create(_id,value,ANIM_TWEEN.SINE,ANIM_EASE.OUT,start,target-start,time/2,delay)
	scr_anim_create(_id,value,ANIM_TWEEN.SINE,ANIM_EASE.IN,target,start-target,time/2,time/2+delay)
}