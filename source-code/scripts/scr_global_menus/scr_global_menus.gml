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
					for (i=0;i<1024;i++) global.msg[i]=""
					global.msg[0]="<timer=10>... <timer=30>Ты что,<timer=20> <c4=16711680=16711680=65535=65535>хохол?<color/><timer=30> Сам иди <color=255>нахуй.<color/>"
					
				},
				color:	color,
			},
		]
		
		_menu_setup2()
	}
	
	
	
	
	
}