if global.paused=0 {
	
	if !(current_char_str()="") {
	
		if getkey("ok",pressed) while !(current_char_str()="") {
			scr_writer_format()
			write()
		}
		else {
			/*if timer<1 {
				scr_writer_format()
				write()
			} else timer--*/
			scr_writer_format()
			if timer<1 write() else timer--
		}
	
	} else {
	
		if getkey("ok",pressed) {
		
			with o_letter destroy=1
			current_msg++
			if global.msg[current_msg]="" reset() else reset(1)
		
		}
	
	}
	
	if active=1 dbox_y1=lerp(dbox_y1,dbox_y1_open,dbox_anim_speed) else dbox_y1=lerp(dbox_y1,dbox_y1_close,dbox_anim_speed)
}

	draw_set_color(0)
	draw_rectangle(dbox_x1,dbox_y1,dbox_x2,dbox_y2,0)
	draw_set_color(c_white)
