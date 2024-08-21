function scr_init_localizer() {
	// Put supported languages here
	global.langs = [
		"ru",
		"en",
	]
	
	for(var _i=0;_i<array_length(global.langs);_i++) {
		var _lang_file = file_text_open_read(working_directory+"localizations/"+global.langs[_i]+".l")
		var _lang = ""
		while (!file_text_eof(_lang_file)) _lang += file_text_readln(_lang_file)
		global.localization[_i] = json_parse(_lang)
	}
}

function localize(_string) {
	var _lang = array_get_index(global.langs,global.game.lang)
	if struct_exists(global.localization[_lang], _string) return struct_get(global.localization[_lang], _string)
	else return "Unlocalized string \""+_string+"\""
}

// To make string dynamic, use construction like
// function(){return localize("options_pause_menu_caption")}