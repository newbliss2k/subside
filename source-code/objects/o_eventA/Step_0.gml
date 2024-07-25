
if (global.game.pause=0) and (global.game.mode="walk") and place_meeting(x,y,o_chara) and getkey("ok",pressed) {
	getkey("ok",clear)
	
	msg_text("Тест.<timer=30><c4=65535=65535=255=255> Этот текст написан желто-красным цветом.<timer=30><color/> А этот нет.")
	msg_text("В этом тексте есть <color=65280>задержка<color/> после знаков препинания./n<timer=30>Круто,<timer=15> не прадва ли?")
	
	msg_poll([
		
		/* 1 */ {text:"Вариант 1",func: function(){
			
			msg_text("Вы выбрали Вариант 1! <timer=30>Так держать!")
			
		}},
		/* 2 */ {text:"Вариант 2",func: function(){
			
			msg_text("Вы выбрали Вариант 2. <timer=30>Не так круто,<timer=10> как Вариант 1,<timer=10> но тоже неплохо!")
			
		}},
		
	])
	
}