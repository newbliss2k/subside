function scr_file_load_options(){
	
	if file_exists("options.ss") {
		
		var _file = file_text_open_read("options.ss")
		
		/* 001 */	global.key1.up=file_text_read_real(_file)
					file_text_readln(_file)
		/* 002 */	global.key2.up=file_text_read_real(_file)
					file_text_readln(_file)
		/* 003 */	global.key1.left=file_text_read_real(_file)
					file_text_readln(_file)
		/* 004 */	global.key2.left=file_text_read_real(_file)
					file_text_readln(_file)
		/* 005 */	global.key1.down=file_text_read_real(_file)
					file_text_readln(_file)
		/* 006 */	global.key2.down=file_text_read_real(_file)
					file_text_readln(_file)
		/* 007 */	global.key1.right=file_text_read_real(_file)
					file_text_readln(_file)
		/* 008 */	global.key2.right=file_text_read_real(_file)
					file_text_readln(_file)
		/* 009 */	global.key1.ok=file_text_read_real(_file)
					file_text_readln(_file)
		/* 010 */	global.key2.ok=file_text_read_real(_file)
					file_text_readln(_file)
		/* 011 */	global.key1.cancel=file_text_read_real(_file)
					file_text_readln(_file)
		/* 012 */	global.key2.cancel=file_text_read_real(_file)
					file_text_readln(_file)
		/* 013 */	global.key1.menu=file_text_read_real(_file)
					file_text_readln(_file)
		/* 014 */	global.key2.menu=file_text_read_real(_file)
					file_text_readln(_file)
		
		file_text_close(_file)
		
	}
	else {
		
		scr_file_save_options()
		
	}
	
}

function scr_file_save_options(){
	
	var _file = file_text_open_write("options.ss")
		
		/* 001 */	file_text_write_real(_file,vk_up)
					file_text_writeln(_file)
		/* 002 */	file_text_write_real(_file,global.key2.up)
					file_text_writeln(_file)
		/* 003 */	file_text_write_real(_file,global.key1.left)
					file_text_writeln(_file)
		/* 004 */	file_text_write_real(_file,global.key2.left)
					file_text_writeln(_file)
		/* 005 */	file_text_write_real(_file,global.key1.down)
					file_text_writeln(_file)
		/* 006 */	file_text_write_real(_file,global.key2.down)
					file_text_writeln(_file)
		/* 007 */	file_text_write_real(_file,global.key1.right)
					file_text_writeln(_file)
		/* 008 */	file_text_write_real(_file,global.key2.right)
					file_text_writeln(_file)
		/* 009 */	file_text_write_real(_file,global.key1.ok)
					file_text_writeln(_file)
		/* 010 */	file_text_write_real(_file,global.key2.ok)
					file_text_writeln(_file)
		/* 011 */	file_text_write_real(_file,global.key1.cancel)
					file_text_writeln(_file)
		/* 012 */	file_text_write_real(_file,global.key2.cancel)
					file_text_writeln(_file)
		/* 013 */	file_text_write_real(_file,global.key1.menu)
					file_text_writeln(_file)
		/* 014 */	file_text_write_real(_file,global.key2.menu)
					file_text_writeln(_file)
		
	file_text_close(_file)
	
}

