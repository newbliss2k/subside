function scr_global_menus_setup() {

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
				title:	"Resume",
				func:	function(){
					global.game.pause=0
					
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	"Inventory",
				func:	function(){
					log_push("Inventory is not finished yet!")
					
					
				},
				color:	color,
			},
			
			/* 002 */ {
				title:	"Debug",
				func:	function(){
					log_push("You opened debug menu!")
					_menu_open(global.menus.debug)
				},
				color:	color,
			},
			
			/* 003 */ {
				title:	"Settings",
				func:	function(){
					log_push("You opened settings menu!")
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
		
		caption="DEBUG MENU"
		
		options=[
			/* 000 */ {
				title:	"Back",
				func:	function(){
					_menu_open(global.menus.pause)
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	"Yaderka na Lviv",
				func:	function(){
					log_push("Ааааааааа пук моем сало аааа нас то за щооооооо")
					log_push("Хохол был убит ядернкой....",c_red,c_red,c_red,c_red)
					
					
				},
				color:	color,
			},
			
			/* 002 */ {
				title:	"Does Nothing",
				func:	function(){
					
					
				},
				color:	color,
			},
			
			/* 003 */ {
				title:	"Iдi нахуй",
				func:	function(){
					global.game.pause=0
					_menu_open(global.menus.pause)
					global.msg=[]
					global.msg[0]="<timer=10>... <timer=25>Ты что,<timer=20> <c4=16711680=16711680=65535=65535>хохол?<color/><timer=25> Сам иди <color=255>нахуй.<color/>"
					
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
		
		caption="SETTINGS"
		
		options=[
			/* 000 */ {
				title:	"Back",
				func:	function(){
					_menu_open(global.menus.pause)
					
				},
				color:	color,
			},
			
			/* 001 */ {
				title:	("Switch (0)"),
				func:	function(){
					global.options.switch_1=!global.options.switch_1
					
					
				},
				color:	color,
				func_step:	function(){
					if global.options.switch_1=0 title="Switch is turned off((("
					else title="Switch is TURNED ON!!!!! UWUU NYA !!!! HOHLi PIDORI SOSITE!!!(⁠◍⁠•⁠ᴗ⁠•⁠◍⁠)⁠✧⁠*⁠。(⁠>⁠0⁠<⁠；⁠)"
				},
			},
		]
		
		_menu_setup2()
	}
	
	
	
}

}