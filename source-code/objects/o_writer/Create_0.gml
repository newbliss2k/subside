// POSITION CONSTANTS
		
		dbox_x1=0
		dbox_x2=427*2
		dbox_y1=241*2 // variable
		dbox_y2=242*2
		
		dbox_y1_open=200*2
		dbox_y1_close=241*2
		
		dbox_anim_speed=0.1
		
		text_x=10
		new_line_offset=24
		
		
		alpha2=0
		create=0
		x_border=0
		y_border=0
		yscale2=0
		
		
function current_char_str(_offset=0) {
	return string_char_at(global.msg[current_msg],current_char+_offset)
}

function get_keyword(_end_char=">") {
	var _key=""
	while !(current_char_str(1)=_end_char) {
		current_char++
		_key+=current_char_str()
	}
	current_char+=2
	return _key
}

function reset(_soft=0) {
	
	if _soft=0 {
		for (i=0;i<1024;i++) global.msg[i]=""
		global.game.mode="walk"
		active=0
		current_msg=0
		
	}
	
	current_char=1
	timer=0
	letter=0
	

	// LETTER PROPERTIES BY DEFAULT

	font=font_normal

	str=0
	xscale=1
	yscale=1
	angle=0
	c1=c_white
	c2=c_white
	c3=c_white
	c4=c_white
	alpha=1
	
	x=text_x
	y=0
	
}

reset()

function write() {
	
	active=1
	global.game.mode="dialogue"
	letter=instance_create_depth(x,y,-14001,o_letter)
	
	with letter {
		str=string_char_at(global.msg[o_writer.current_msg],o_writer.current_char)
		xscale=o_writer.xscale
		yscale=o_writer.yscale
		yscale2=1
		angle=o_writer.angle
		c1=o_writer.c1
		c2=o_writer.c2
		c3=o_writer.c3
		c4=o_writer.c4
		alpha=o_writer.alpha
		alpha2=0
			
		font=o_writer.font
		destroy=0
		create=1
		
		
		x_border=5
		y_border=5
	}
	
	draw_set_font(font)
	if current_char_str()=" "
		x+=string_width(current_char_str())+2
	else
		x+=string_width(current_char_str())-2
	current_char++
	timer++
	
}