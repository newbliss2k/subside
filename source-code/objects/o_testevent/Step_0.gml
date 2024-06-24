
if global.gamemode="walk" and place_meeting(x,y,o_chara) and getkey("ok",pressed) {
	getkey("ok",clear)
	global.msg[0]="Тест.<timer=30><c4=65535=65535=255=255> Этот текст написан желто-красным цветом.<timer=30><color/> А этот нет."
	global.msg[1]="В этом тексте есть <color=65280>задержка<color/> после знаков препинания./n<timer=30>Круто,<timer=15> не прадва ли?"
}