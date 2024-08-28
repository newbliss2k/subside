var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

if turn_player {
	
	if (getkey("up",pressed) and screen.nav_v) or (getkey("left") and screen.nav_v=0) {
		selector--
		if selector<0 selector=-1+array_length(screen.options)
	}
	
	if (getkey("down",pressed) and screen.nav_v) or (getkey("right") and screen.nav_v=0) {
		selector++
		if selector>=array_length(screen.options) selector=0
	}
	
	if getkey("ok",pressed) {
		screen.options[selector].func()
	}
	
}
else {
	
	if instance_exists(o_battle_chara) {
		
		
		
	}
	else {
		
		instance_create_depth(room_width/2,room_height/2+battlefield_yoffset/2,depth-1,o_battle_chara)
		
		for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
		
			global.battle.enemies[_i].create()
		
		}
		
	}
	
	for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
		
		global.battle.enemies[_i].func()
		
	}
	
}

switch screen.name {
	
	case "start":
		break
	
	
	
}