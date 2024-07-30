
if (global.game.pause=0) and (global.game.mode="walk") and place_meeting(x,y,o_chara) and getkey("ok",pressed) and (o_writer.active=0) {
	getkey("ok",clear)
	
	msg_text("Здравствуйте,<timer=15> и добро пожаловать в тестовую комнату!<timer=30> Я -<timer=15> тестовая табличка.")
	//msg_text("В этом тексте есть <color=65280>задержка<color/> после знаков препинания. <timer=30>Круто,<timer=15> не прадва ли?")
	msg_text("В этом тексте есть <color=65280>задержка<color/> после знаков препинания.<timer=25> Круто,<timer=15> не прадва ли?<timer=15> ")
	
	msg_poll([
		
		/* 0 */ {ir:1, text:"\"Нет\"",func: function(_ir=0){
			
			if _ir {
				
				msg_text("Это было грубо<timer=15>.<timer=15>.<timer=25> Когда ты перебиваешь собеседника,<timer=15> ему может стать обидно!<timer=25> Помни это,<timer=15> когда разговариваешь с другими персонажами.")
				msg_text("Больше так не делай,<timer=15> хорошо?<timer=15> ")
				
				msg_poll([
				
					/* 0 */ {ir:1, text:"\"Завались\"",func: function(_ir=0){
						
						msg_text("Ты грубый.<timer=25> Я-то не обижусь,<timer=15> а другие NPC могут.")
						
					}},
					
					/* 1 */ {text:"\"Извини, я не знал!\"",func: function(_ir=0){
						
						msg_text("Ничего страшного!<timer=25> Все мы ошибаемся.")
						
					}},
				
				])
			}
			else {
				msg_text("Жаль...<timer=25> Ты можешь выбрать другие варианты ответов,<timer=15> используя стрелки или кнопки W и S.<timer=25> Просто поговори с табличкой ещё раз!")
			}
			
		}},
		
		/* 1 */ {text:"\"Да!\"",func: function(_ir=0){
			
			msg_text("Я рад,<timer=15> что тебе понравилось!<timer=25> Ты можешь легко редактировать события в редакторе GameMaker.<timer=25> Просто скачай исходный код этой игры!<timer=15> ")
			
			msg_poll([
				
					/* 0 */ {text:"\"Открой страницу с исходным кодом\"",func: function(_ir=0){
						
						msg_func(function(){url_open("https://github.com/newbliss2k/subside")})
						msg_text("Я открыл страницу с исходным кодом игры на GitHub.<timer=25> Приятного моддинга!")
						
					}},
					
					/* 1 */ {text:"\"Приму к сведению\"",func: function(_ir=0){
						
						msg_text("Отлично!")
						
					}},
				
				])
			
		}},
		
		/* 2 */ {text:"\"Третий вариант\"",func: function(_ir=0){
			
			msg_text("Я не придумал,<timer=15> что ответить!")
			
		}},
		
	])
	
}