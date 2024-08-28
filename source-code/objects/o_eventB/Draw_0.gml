event_inherited()

if player_event() {
	
	switch flag {
	case 0:
		msg_text("Ты видишь странный артефакт в сломанной стене.<timer=25> Прикоснуться к нему?<timer=25> ")
		msg_poll([
			/* 0 */ {text:"\"Да\"",func: function(_ir=0){
				msg_func(function(){
					var _rnd = random_range(6,7)
					o_glitch.intensity = _rnd
					o_eventB.flag=1
				})
			}},
			/* 1 */ {text:"\"Нет\"",func: function(_ir=0){
				msg_func(function(){
				
				})
			}},
		])
		break
	
	case 1:
		msg_text("Посмотри,<timer=15> что ты натворил.")
		msg_text("Возможно,<timer=15> если прикоснуться к этому артефакту еще раз,<timer=15> то все придет в норму.<timer=25> Попробовать?<timer=25> ")
		msg_poll([
			/* 0 */ {text:"\"Да\"",func: function(_ir=0){
				msg_func(function(){
					var _rnd = 0
					o_glitch.intensity = o_glitch.intensity_default
					o_eventB.flag=2
				})
			}},
			/* 1 */ {text:"\"Нет\"",func: function(_ir=0){
				msg_func(function(){
					
				})
			}},
		])
		break
	
	case 2:
		msg_text("Лучше не прикасаться к этой штуке.")
		break
	}
}