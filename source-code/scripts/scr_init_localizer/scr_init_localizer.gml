function scr_init_localizer() {
	// Put supported languages here
	global.langs = [
		"ru",
		"en",
	]
}

function localize(_string) {
	var _lang = array_get_index(global.langs,global.game.lang)
	if struct_exists(global.localization[_lang], _string) return struct_get(global.localization[_lang], _string)
	else return "Unlocalized string \""+_string+"\""
}

function formatize(_string) {
	_string = string_replace(_string,"","")
	
	
}

function fl(_string) {
	
	return formatize(localize(_string))
	
}