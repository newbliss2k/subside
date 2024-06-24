function scr_getkey_setup(){
	
	// this is setup script. it must be called in start of the game
	
	#macro pressed 1
	#macro released 2
	#macro direct 3
	#macro clear 4
	
	#macro mouse_left -4
	#macro mouse_right -3
	#macro mouse_center -2
	#macro mouse_no -5
	#macro mouse_any -6
	
	#macro unset -7
	
	// key load from file
		
		global.key1={}
		global.key2={}
		
		// primary keys definition
		
		global.key1.up		=	vk_up
		global.key1.left	=	vk_left
		global.key1.down	=	vk_down
		global.key1.right	=	vk_right
		
		global.key1.ok		=	ord("A")
		global.key1.cancel	=	ord("S")
		global.key1.menu	=	ord("D")
		
		global.key1.res		=	ord("R")
		global.key1.esc		=	vk_escape
		
		// secondary keys definition
		
		global.key2.up		=	unset
		global.key2.left	=	unset
		global.key2.down	=	unset
		global.key2.right	=	unset
		
		global.key2.ok		=	unset
		global.key2.cancel	=	unset
		global.key2.menu	=	unset
		
		global.key2.res		=	unset
		global.key2.esc		=	unset
		
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
		
		case clear:
			if _key1>0 keyboard_clear(_key1)
			if _key2>0 keyboard_clear(_key2)
		
		}

}