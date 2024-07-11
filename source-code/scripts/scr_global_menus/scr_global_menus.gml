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
					_menu_open(global.menus.debug)
				},
				/* 002 Color */ color,
			],
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
			/* 000 */ [
				/* 000 Title */ "Back",
				/* 001 Function */ function(){
					_menu_open(global.menus.pause)
					
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
					_menu_open(global.menus.pause)
					global.msg[0]="<timer=10>... <timer=30>Ты что,<timer=20> <c4=16711680=16711680=65535=65535>хохол?<color/><timer=30> Сам иди <color=255>нахуй.<color/>"
					
				},
				/* 002 Color */ color,
			],
		]
		
		_menu_setup2()
	}
	
	
	
	
	
}