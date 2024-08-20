if getkey("esc") {
	if game_end_timer>=game_end_timer_max
		game_end()
	else {
		game_end_timer++
	}
}
else game_end_timer=max(0,game_end_timer-1)

if getkey("menu",pressed) if global.game.mode="walk" global.game.pause=!global.game.pause

/*
view_xport[0]=irandom_range(-0.1,0)
view_yport[0]=irandom_range(-0.1,0)
view_wport[0]=irandom_range(50,100)
view_hport[0]=irandom_range(50,100)*/




