function scr_init_global_menus_setup() {

global.menus={}
with global.menus {
	
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	//
	//	PAUSE MENU
	//
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	
	pause={}
	with pause {
		
		_menu_setup1()
		
		options=[
			/* 000 */ {
				title:	function(){return localize("options_pause_menu_resume")},
				func:	function(){
					global.game.pause=0
					
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	function(){return localize("options_pause_menu_inventory")},
				func:	function(){
					//log_push("Inventory is not finished yet!")
					
					
				},
				color:	color,
			},
			
			/* 002 */ {
				title:	function(){return localize("options_pause_menu_debug")},
				func:	function(){
					//log_push("You opened debug menu!")
					_menu_open(global.menus.debug)
				},
				color:	color,
			},
			
			/* 003 */ {
				title:	function(){return localize("options_pause_menu_settings")},
				func:	function(){
					//log_push("You opened settings menu!")
					_menu_open(global.menus.settings)
				},
				color:	color,
			},
		]
		
		_menu_setup2()
	}
	
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	//
	//	DEBUG MENU
	//
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	
	debug={}
	with debug {
		
		_menu_setup1()
		
		caption=function(){return localize("options_debug_menu_caption")}
		
		options=[
			/* 000 */ {
				title:	function(){return localize("options_back")},
				func:	function(){
					_menu_open(global.menus.pause)
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	function(){return localize("options_debug_menu_yaderka")},
				func:	function(){
					log_push("Ааааааааа пук моем сало аааа нас то за щооооооо")
					log_push("Хохол был убит ядернкой....",c_red,c_red,c_red,c_red)
					
					
				},
				color:	color,
			},
			
			/* 002 */ {
				title:	function(){return localize("options_debug_menu_does_nothing")},
				func:	function(){
					
					
				},
				color:	color,
			},
			
			/* 003 */ {
				title:	function(){return localize("options_debug_menu_idi_nahui")},
				func:	function(){
					global.game.pause=0
					_menu_open(global.menus.pause)
				},
				color:	color,
			},
		]
		
		_menu_setup2()
	}
	
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	//
	//	SETTINGS MENU
	//
	// // // // // // // // // // // // // // // // // // // // // // // // //
	// // // // // // // // // // // // // // // // // // // // // // // // //
	
	settings={}
	with settings {
		
		_menu_setup1()
		
		caption=function(){return localize("options_settings_menu_caption")}
		
		options=[
			/* 000 */ {
				title:	function(){return localize("options_back")},
				func:	function(){
					_menu_open(global.menus.pause)
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	"",
				func:	function(){
					
					var _lang = array_get_index(global.langs,global.game.lang)
					if (_lang+1)>=array_length(global.langs) _lang=0 else _lang++
					global.game.lang=global.langs[_lang]
					
				},
				color:	color,
				func_step:	function(){
					title = localize("lang_name")
				},
			},
			
			/* 002 */ {
				title:	"",
				func:	function(){
					
					window_set_fullscreen(!window_get_fullscreen())
					window_set_size(global.options.resolutions[global.options.resolution][1],global.options.resolutions[global.options.resolution][2])
					window_center()
					
				},
				color:	color,
				func_step:	function(){
					title = localize("options_settings_menu_fullscreen"+string(window_get_fullscreen()))
				},
			},
			
			/* 003 */ {
				title:	"",
				func:	function(){
					
					if (global.options.resolution+1)>=array_length(global.options.resolutions) global.options.resolution=0 else global.options.resolution++
					window_set_size(global.options.resolutions[global.options.resolution][1],global.options.resolutions[global.options.resolution][2])
					window_center()
					
				},
				color:	color,
				func_step:	function(){
					title = localize("options_settings_menu_resolution")+" "+string(global.options.resolutions[global.options.resolution][0])
				},
			},
		]
		
		_menu_setup2()
	}
	
	
	
}

}