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
		
		global.options.key1={}
		global.options.key2={}
		
		// primary keys definition
		
		global.options.key1.up		=	ord("W")
		global.options.key1.left	=	ord("A")
		global.options.key1.down	=	ord("S")
		global.options.key1.right	=	ord("D")
		
		global.options.key1.ok		=	vk_space
		global.options.key1.back	=	ord("Q")
		global.options.key1.menu	=	ord("E")
		
		global.options.key1.res		=	ord("R")
		global.options.key1.esc		=	vk_escape
		
		// secondary keys definition
		
		global.options.key2.up		=	vk_up
		global.options.key2.left	=	vk_left
		global.options.key2.down	=	vk_down
		global.options.key2.right	=	vk_right
		
		global.options.key2.ok		=	unset
		global.options.key2.back	=	unset
		global.options.key2.menu	=	unset
		
		global.options.key2.res		=	unset
		global.options.key2.esc		=	unset
	
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
	
	var _key1=variable_struct_get(global.options.key1,_key)
	var _key2=variable_struct_get(global.options.key2,_key)
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