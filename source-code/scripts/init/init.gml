// INIT SCRIPT

global.depth=-14000

global.game={}
with global.game {
	
	depth=-14000
	pause=0
	player_control=0
	screen="main"
	screen_history=[]
	animspeed=1
	
	restarted=0
	chara_restart_x=0
	chara_restart_y=0
}

scr_getkey_setup()

scr_file_load_options()

