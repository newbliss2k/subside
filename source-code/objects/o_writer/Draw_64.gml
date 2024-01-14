if timer=0 {
	
	if !string_char_at(global.msg[current_msg],current_char)="" {
		
		scr_writer_format()
		active=1
		letter=instance_create_depth(-15999,x,y,o_letter)
		with letter {
			
			letter=string_char_at(global.msg[current_msg],current_char)
			font=o_writer.font
			
		}
		x+=string_width(string_char_at(global.msg[current_msg],current_char))
		current_char++
		timer++
		
	} else {
		
		if getkey("z") {
			
			with o_letter destroy=1
			
		}
		
	}
	
} else timer--

if active=1 {
	
	draw_sprite_stretched(s_dialogbox1,-1,dialogbox_x_padding,dialogbox_y_padding,dialogbox_width,dialogbox_height)
	
}