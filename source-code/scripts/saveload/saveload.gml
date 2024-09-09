function scr_save_options(){
	var _filename = game_save_id+"options.dat"
	var _file = file_text_open_write(_filename)
	var _data = json_stringify(global.options)
	
	file_text_write_string(_file,_data)
	file_text_close(_file)
}

function scr_load_options(){
	var _filename = game_save_id+"options.dat"
	if file_exists(_filename) {
		var _file = file_text_open_read(_filename)
		var _data = file_text_read_string(_file)
		
		global.options=json_parse(_data)
		
		file_text_close(_file)
		
		window_set_size(global.options.resolutions[global.options.resolution][1],global.options.resolutions[global.options.resolution][2])
		window_center()
		
		window_set_fullscreen(global.options.fullscreen)
		
	} else scr_save_options()
}

function scr_del_options(){
	var _filename = game_save_id+"options.dat"
	if file_exists(_filename) file_delete(_filename)
}