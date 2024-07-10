// INIT SCRIPT

global.game={}
with global.game {
	
	pause=0
	menu=0
	
}

// MENU SETUP

function _menu_setup(){
		var _menu_x
		if x_pos=-1 _menu_x=x_offset
		else if x_pos=1 _menu_x=display_get_gui_width()-x_offset
		else if x_pos=0 _menu_x=display_get_gui_width()/2
		
		var _menu_y
		if y_pos=-1 _menu_y=y_offset
		
		draw_set_font(font_title)
		
		var _menu_caption_x
		if x_pos=-1 _menu_caption_x=_menu_x
		else if x_pos=1 _menu_caption_x=_menu_x-string_width(caption)
		else if x_pos=0 _menu_caption_x=_menu_x-string_width(caption)/2
		
		var _menu_caption_y
		if y_pos=-1 _menu_caption_y=_menu_y-string_height(caption)
		
		draw_set_color(color)
		draw_text(_menu_caption_x,_menu_caption_y,caption)
		
		draw_set_font(font_normal)
		
		menu_selector_y1=_menu_x
		menu_selector_y2=menu_selector_y1+string_height(options[0][0])
		
		if x_pos=-1 or x_pos=1 {
			menu_selector_x1=_menu_x
			menu_selector_x2=_menu_x-x_pos*string_width(options[0][0])
		}
		else if x_pos=0 {
			menu_selector_x1=_menu_x-string_width(options[0][0])/2
			menu_selector_x2=_menu_x+string_width(options[0][0])/2
		}
}

global.menus={}
with global.menus {
	
	pause={}
	with pause {
		
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
		
		options=[
			/* 000 */ [
				/* 000 Title */ "Resume",
				/* 001 Function */ function(){
					global.game.pause=0
					
					
				},
				/* 002 Color */ color,
			],
			
			/* 001 */ [
				/* 000 Title */ "Inventory",
				/* 001 Function */ function(){
					log_push("Inventory is not finished yet!")
					
					
				},
				/* 002 Color */ color,
			],
			
			/* 002 */ [
				/* 000 Title */ "Debug",
				/* 001 Function */ function(){
					log_push("You opened debug menu!")
					global.game.menu=global.menus.debug
					o_handler.menu_selector=0
				},
				/* 002 Color */ color,
			],
		]
		
		_menu_setup()
	}
	
	debug={}
	with debug {
		
		type="list"
		
		caption="DEBUG MENU"
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
		
		options=[
			/* 000 */ [
				/* 000 Title */ "Back",
				/* 001 Function */ function(){
					global.game.menu=global.menus.pause
					o_handler.menu_selector=0
					
				},
				/* 002 Color */ color,
			],
			
			/* 001 */ [
				/* 000 Title */ "Yaderka na Lviv",
				/* 001 Function */ function(){
					log_push("Ааааааааа пук моем сало аааа нас то за щооооооо")
					log_push("Хохол был убит ядернкой....",c_red,c_red,c_red,c_red)
					
					
				},
				/* 002 Color */ color,
			],
			
			/* 002 */ [
				/* 000 Title */ "Does Nothing",
				/* 001 Function */ function(){
					
					
				},
				/* 002 Color */ color,
			],
			
			/* 003 */ [
				/* 000 Title */ "Iдi нахуй",
				/* 001 Function */ function(){
					global.game.pause=0
					global.game.menu=global.menus.pause
					o_handler.menu_selector=0
					global.msg[0]="<timer=10>... <timer=30>Ты что,<timer=20> <c4=16711680=16711680=65535=65535>хохол?<color/><timer=30> Сам иди <color=255>нахуй.<color/>"
					
				},
				/* 002 Color */ color,
			],
		]
		
		_menu_setup()
	}
	
	
	
	
	
}

// MSG SETUP

for (i=0;i<1024;i++) global.msg[i]=""

scr_getkey_setup()

scr_file_load_options()

