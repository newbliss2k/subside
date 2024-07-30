if (global.game.pause=0) and (global.game.mode="walk") and place_meeting(x,y,o_chara) and getkey("ok",pressed) and (o_writer.active=0) {
	getkey("ok",clear)
	
	var _rnd = random_range(0,1)
	o_glitch.intensity = _rnd
	log_push("Ok! New intencity is "+string(_rnd))
	
}