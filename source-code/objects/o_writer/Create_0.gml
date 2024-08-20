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
		
		poll_selector=0
		
		poll_x=15
		poll_y=390
		
		poll_selector_alpha=0
		poll_string_height=20
		
		poll_s_x1=0
		poll_s_x2=0
		poll_s_y1=0
		poll_s_y2=0
		
		poll_border_x=8
		poll_border_y=4
		
		poll_duration_border=5
		
		max_line_width=840
		
		key_draw_alpha=0
		
function current_char_str(_offset=0) {
	return string_char_at(global.msg[current_msg].text,current_char+_offset)
}

function char_str(_offset=0) {
	return string_char_at(global.msg[current_msg].text,_offset)
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

function get_keyword_soft(_end_char=">") {
	var _key=""
	while !(current_char_str(1)=_end_char) {
		current_char++
		_key+=current_char_str()
	}
	return _key
}

function reset(_soft=0) {
	
	if _soft=0 {
		global.msg=[]
		global.game.mode="walk"
		active=0
		current_msg=0
		
	}
	
	poll_selector_create=1
	
	current_char=1
	timer=0
	timer_snd=0
	
	timer_line=0
	timer_redline=0
	
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