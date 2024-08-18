// INIT SCRIPT

scr_global_menus_setup()

global.game={}
with global.game {
	
	pause=0
	menu=0
	mode="walk"
	language="ru"
}


global.options={}
with global.options {
	
	switch_1=0
	
}

// MSG SETUP

global.msg=[]

scr_getkey_setup()

scr_file_load_options()

