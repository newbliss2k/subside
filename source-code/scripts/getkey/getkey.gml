function scr_getkey_setup(){
	
	// this is setup script. it must be called in start of the game
	
	#macro pressed 1
	#macro released 2
	#macro direct 3
	
	#macro mouse_left -4
	#macro mouse_right -3
	#macro mouse_center -2
	#macro mouse_no -5
	#macro mouse_any -6
	
	#macro unset -7
	
	// key load from file
	
	ini_open("file_config")
		
		global.key1={}
		global.key2={}
		
		// primary keys definition
		
		global.key1.w=ini_read_real("key1","w",ord("W")) // Jump
		global.key1.a=ini_read_real("key1","a",ord("A")) // Left
		global.key1.s=ini_read_real("key1","s",ord("S")) // Down
		global.key1.d=ini_read_real("key1","d",ord("D")) // Right
		
		global.key1.use=ini_read_real("key1","use",mouse_right) // Throw
		global.key1.atk=ini_read_real("key1","atk",mouse_left) // Attack
		
		global.key1.restart=ini_read_real("key1","res",ord("R")) // Restart
		global.key1.look=ini_read_real("key1","look",vk_shift) // Look Around
		global.key1.pause=ini_read_real("key1","pause",vk_escape) // Back
		
		// secondary keys definition
		
		global.key2.w=ini_read_real("key2","w",ord("W")) // Jump
		global.key2.a=ini_read_real("key2","a",ord("A")) // Left
		global.key2.s=ini_read_real("key2","s",ord("S")) // Down
		global.key2.d=ini_read_real("key2","d",ord("D")) // Right
		
		global.key2.use=ini_read_real("key2","use",vk_space) // Throw
		global.key2.atk=ini_read_real("key2","atk",unset) // Attack
		
		global.key2.restart=ini_read_real("key2","res",unset) // Restart
		global.key2.look=ini_read_real("key2","look",vk_control) // Look Around
		global.key2.pause=ini_read_real("key2","pause",vk_enter) // Back
		
	ini_close()
	
}

function scr_getkey_add(__key){
	
	if !(__key=unset) if __key > -2 return keyboard_check(__key)
	else return mouse_check_button(__key+5)
	
}

function scr_getkey_add_pressed(__key){
	
	if !(__key=unset) if __key > -2 return keyboard_check_pressed(__key)
	else return mouse_check_button_pressed(__key+5)
	
}

function scr_getkey_add_released(__key){
	
	if !(__key=unset) if __key > -2 return keyboard_check_released(__key)
	else return mouse_check_button_released(__key+5)
	
}

function scr_getkey_add_direct(__key){
	
	if !(__key=unset) if __key > -2 return keyboard_check_direct(__key)
	else throw("Error!")
	
}

function getkey(_key,_type=0){
	
	var _key1=variable_struct_get(global.key1,_key)
	var _key2=variable_struct_get(global.key2,_key)
	//show_debug_message(string(mb_left)+" "+string(mb_middle)+" "+string(mb_right)+" "+string(mb_any)+" "+string(mb_none))
	//show_debug_message("1:"+string(_key1)+" 2:"+string(_key2)+" 0:"+string(_key))
	
	switch _type {
		
		case 0: if ((scr_getkey_add(_key1)) || (scr_getkey_add(_key2))) return 1 else return 0
		
		case pressed: if ((scr_getkey_add_pressed(_key1)) || (scr_getkey_add_pressed(_key2))) return 1 else return 0
		
		case released: if ((scr_getkey_add_released(_key1)) || (scr_getkey_add_released(_key2))) return 1 else return 0
			
		case direct: if ((scr_getkey_add_direct(_key1)) || (scr_getkey_add_direct(_key2))) return 1 else return 0
		
		}

}