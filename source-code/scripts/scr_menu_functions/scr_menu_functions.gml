function scr_handler_menu_get_title_local(_num){
	
	var _title
	if is_method(options[_num].title) _title = options[_num].title()
	else _title = options[_num].title
	if is_string(_title) return _title
	else return "Error: Not string/method->string"
	
}

function _menu_setup1(){
	
	selector=0
	
	type="list"
	
	caption=function(){return localize("options_pause_menu_caption")}
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
		
		if selector=0 menu_selector_y1=_menu_y+string_height(scr_handler_menu_get_title_local(0))
		else {
			menu_selector_y1=_menu_y+string_height(scr_handler_menu_get_title_local(0))
			for (var _i=0; _i<selector; _i++) {
				menu_selector_y1+=string_height(scr_handler_menu_get_title_local(_i))
			}
		}
		
		menu_selector_y2=menu_selector_y1+string_height(scr_handler_menu_get_title_local(selector))
		
		if x_pos=-1 or x_pos=1 {
			menu_selector_x1=_menu_x
			menu_selector_x2=_menu_x-x_pos*string_width(scr_handler_menu_get_title_local(selector))
		}
		else if x_pos=0 {
			menu_selector_x1=_menu_x-string_width(scr_handler_menu_get_title_local(selector))/2
			menu_selector_x2=_menu_x+string_width(scr_handler_menu_get_title_local(selector))/2
		}
		
		menu_selector_y1=_menu_y
		menu_selector_y2=menu_selector_y1+string_height(scr_handler_menu_get_title_local(0))
		
		if x_pos=-1 or x_pos=1 {
			menu_selector_x1=_menu_x
			menu_selector_x2=_menu_x-x_pos*string_width(scr_handler_menu_get_title_local(0))
		}
		else if x_pos=0 {
			menu_selector_x1=_menu_x-string_width(scr_handler_menu_get_title_local(0))/2
			menu_selector_x2=_menu_x+string_width(scr_handler_menu_get_title_local(0))/2
		}
		
		menu_selector_x1-=5
		menu_selector_x2+=2
		menu_selector_y1-=0
		menu_selector_y2-=1
}

function _menu_open(_object) {
	
	global.game.menu=_object
	selector=0
	selector_create=1
	with _object _menu_setup2()
	
}