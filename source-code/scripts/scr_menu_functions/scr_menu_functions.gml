function _menu_setup1(){
	
	selector=0
	
	type="list"
		
	caption="PAUSED"
	caption_color=c_white
		
	color=c_white
	color_bg=c_black
		
	alpha=1
	alpha_bg=0.6
		
	x_pos=-1 // right by default
	y_pos=-1 // center by default
		
	x_offset=50
	y_offset=80
		
	// offset is unused if pos=0
	
}

function _menu_setup2(){
		var _menu_x
		if x_pos=-1 _menu_x=x_offset
		else if x_pos=1 _menu_x=display_get_gui_width()-x_offset
		else if x_pos=0 _menu_x=display_get_gui_width()/2
		
		var _menu_y
		if y_pos=-1 _menu_y=y_offset
		
		draw_set_font(font_normal)
		
		if selector=0 menu_selector_y1=_menu_y+string_height(options[0][0])
		else {
			menu_selector_y1=_menu_y+string_height(options[0][0])
			for (var _i=0; _i<selector; _i++) {
				menu_selector_y1+=string_height(options[_i][0])
			}
		}
		
		menu_selector_y2=menu_selector_y1+string_height(options[selector][0])
		
		if x_pos=-1 or x_pos=1 {
			menu_selector_x1=_menu_x
			menu_selector_x2=_menu_x-x_pos*string_width(options[selector][0])
		}
		else if x_pos=0 {
			menu_selector_x1=_menu_x-string_width(options[selector][0])/2
			menu_selector_x2=_menu_x+string_width(options[selector][0])/2
		}
		
		menu_selector_y1=_menu_y
		menu_selector_y2=menu_selector_y1+string_height(options[0][0])
		
		if x_pos=-1 or x_pos=1 {
			menu_selector_x1=_menu_x
			menu_selector_x2=_menu_x-x_pos*string_width(options[0][0])
		}
		else if x_pos=0 {
			menu_selector_x1=_menu_x-string_width(options[0][0])/2
			menu_selector_x2=_menu_x+string_width(options[0][0])/2
		}
		
		menu_selector_x1-=5
		menu_selector_x2+=2
		menu_selector_y1-=0
		menu_selector_y2-=1
}

function _menu_open(_object) {
	
	global.game.menu=_object
	selector=0
	_menu_setup2()
	
}