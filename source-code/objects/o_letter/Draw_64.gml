if wave_n=-1 wave_n=num

if global.game.pause=0 {
	
	if !((wave=0) or (destroy_ir=1)) {
		
		wave_y=dsin(wave_n*13)*wave
		wave_n+=wave_step
		
	}
	
	draw_set_font(font)
	if destroy=1 {
		create=0
		alpha2=lerp(alpha2,0,0.1)
		//yscale2=lerp(yscale2,2,0.1)
		y_border=lerp(y_border,-10,0.1)
		if alpha2=0 instance_destroy(self)
	}
	
	if destroy_ir=1 {
		
		create=0
		gravity=0.3
		direction=random_range(55,125)
		speed=random_range(5,6.5)
		destroy_ir=2
		destroy_timer=120
		
	}
	
	destroy_timer--
	
	if destroy_ir=2 {
		
		angle+=angle_step
		
		if destroy_timer<1 instance_destroy(self)
		
	}

	if create=1 {
		alpha2=lerp(alpha2,1,0.1)
		x_border=lerp(x_border,0,0.1)
		y_border=lerp(y_border,0,0.1)
	}
}
draw_text_transformed_color(x+x_border,y+y_border+o_writer.dbox_y1+wave_y,str,xscale,yscale*yscale2,angle,c1,c2,c3,c4,alpha*alpha2)
