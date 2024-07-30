function o_handler_draw64_ui() {
	
	log_console()
	//draw_text_color(0,0,string(global.game.menu.selector),c_white,c_white,c_white,c_white,1)
	
	
	if global.game.pause=1 {
		
		if getkey("down",pressed) {
			if global.game.menu.selector=(array_length(global.game.menu.options)-1) global.game.menu.selector=0 
			else global.game.menu.selector++
		}
		else if getkey("up",pressed) {
			if global.game.menu.selector=0 global.game.menu.selector=(array_length(global.game.menu.options)-1)
			else global.game.menu.selector--
		}
		
		if getkey("ok",pressed) {
			global.game.menu.options[global.game.menu.selector].func()
		}
		
		menu_alpha=lerp(menu_alpha,global.game.menu.alpha,menu_lerp_speed)
		menu_alpha_bg=lerp(menu_alpha_bg,global.game.menu.alpha_bg,menu_lerp_speed)
		
	}
	else {
		menu_alpha=lerp(menu_alpha,0,menu_lerp_speed)
		menu_alpha_bg=lerp(menu_alpha_bg,0,menu_lerp_speed)
	}
		
		draw_set_color(c_black)
		draw_set_alpha(menu_alpha_bg)
		draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0)
		
		draw_set_alpha(menu_alpha)
		
		var _menu_x
		if global.game.menu.x_pos=-1 _menu_x=global.game.menu.x_offset
		else if global.game.menu.x_pos=1 _menu_x=display_get_gui_width()-global.game.menu.x_offset
		else if global.game.menu.x_pos=0 _menu_x=display_get_gui_width()/2
		
		var _menu_y
		if global.game.menu.y_pos=-1 _menu_y=global.game.menu.y_offset
		
		
		
		draw_set_font(font_title)
		
		var _menu_caption_x
		if global.game.menu.x_pos=-1 _menu_caption_x=_menu_x
		else if global.game.menu.x_pos=1 _menu_caption_x=_menu_x-string_width(global.game.menu.caption)
		else if global.game.menu.x_pos=0 _menu_caption_x=_menu_x-string_width(global.game.menu.caption)/2
		
		var _menu_caption_y
		if global.game.menu.y_pos=-1 _menu_caption_y=_menu_y-string_height(global.game.menu.caption)
		
		draw_set_color(global.game.menu.color)
		draw_text(_menu_caption_x,_menu_caption_y,global.game.menu.caption)
		
		
		draw_set_font(font_normal)
		
		var _menu_selector_y1
		if global.game.menu.selector=0 _menu_selector_y1=_menu_y+string_height(global.game.menu.options[0].title)
		else {
			_menu_selector_y1=_menu_y+string_height(global.game.menu.options[0].title)
			for (var _i=0; _i<global.game.menu.selector; _i++) {
				_menu_selector_y1+=string_height(global.game.menu.options[_i].title)
			}
		}
		
		var _menu_selector_y2=_menu_selector_y1+string_height(global.game.menu.options[global.game.menu.selector].title)
		
		var _menu_selector_x1
		var _menu_selector_x2
		if global.game.menu.x_pos=-1 or global.game.menu.x_pos=1 {
			_menu_selector_x1=_menu_x
			_menu_selector_x2=_menu_x-global.game.menu.x_pos*string_width(global.game.menu.options[global.game.menu.selector].title)
		}
		else if global.game.menu.x_pos=0 {
			_menu_selector_x1=_menu_x-string_width(global.game.menu.options[global.game.menu.selector].title)/2
			_menu_selector_x2=_menu_x+string_width(global.game.menu.options[global.game.menu.selector].title)/2
		}
		
		global.game.menu.menu_selector_x1=lerp(global.game.menu.menu_selector_x1,_menu_selector_x1-5,menu_lerp_speed)
		global.game.menu.menu_selector_x2=lerp(global.game.menu.menu_selector_x2,_menu_selector_x2+2,menu_lerp_speed)
		global.game.menu.menu_selector_y1=lerp(global.game.menu.menu_selector_y1,_menu_selector_y1,menu_lerp_speed)
		global.game.menu.menu_selector_y2=lerp(global.game.menu.menu_selector_y2,_menu_selector_y2-1,menu_lerp_speed)
		
		draw_set_color(global.game.menu.options[global.game.menu.selector].color)
		draw_rectangle(global.game.menu.menu_selector_x1,global.game.menu.menu_selector_y1,global.game.menu.menu_selector_x2,global.game.menu.menu_selector_y2,0)
		
		var _text_y=_menu_y
		for (var _i=0; _i<=array_length(global.game.menu.options)-1; _i++) {
			
			if variable_struct_exists(global.game.menu.options[_i],"func_step") global.game.menu.options[_i].func_step()
			
			var __x
			if global.game.menu.x_pos=-1 __x=_menu_x
			else if global.game.menu.x_pos=1 __x=_menu_x-string_width(global.game.menu.options[_i].title)
			else if global.game.menu.x_pos=0 __x=_menu_x-string_width(global.game.menu.optoins[_i].title)/2
			
			if global.game.menu.y_pos=-1 {
				_text_y+=string_height(global.game.menu.options[_i].title)
			}
			var __y=_text_y
			
			if global.game.menu.selector=_i draw_set_color(c_black)
			else draw_set_color(global.game.menu.options[_i].color)
			
			draw_text(__x,__y,global.game.menu.options[_i].title)
			
		}
		
	
	
}