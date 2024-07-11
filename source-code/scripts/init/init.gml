// INIT SCRIPT

global.game={}
with global.game {
	
	pause=0
	menu=0
	
}

// MENU SETUP



// MSG SETUP

for (i=0;i<1024;i++) global.msg[i]=""

scr_getkey_setup()

scr_file_load_options()

