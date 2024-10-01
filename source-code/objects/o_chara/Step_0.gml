

depth=-y

x_moving=0
y_moving=0

if global.game.pause=0 and global.game.mode="walk" {
	
	scr_check_priorities()
	
	if getkey("back") {
		x_speed=4
		y_speed=4
	}
	else {
		x_speed=2
		y_speed=2
	}

	// X CONTROL

	if !place_meeting(x+x_speed*x_control,y,o_solid) {
		x+=x_speed*x_control
		x_moving=ceil(x_control)
	}
	else if !place_meeting(x+x_control,y,o_solid) {
		x+=x_control
		x_moving=ceil(x_control)
	} else x_moving=0

	// Y CONTROL

	if !place_meeting(x,y+y_speed*y_control,o_solid) {
		y+=y_speed*y_control
		y_moving=ceil(y_control)
	}
	else if !place_meeting(x,y+y_control,o_solid) {
		y+=y_control
		y_moving=ceil(y_control)
	} else y_moving=0
}

	// ANIMATIONS

	if !(x_control=0) and (y_control=0) {
		anim_x=x_control
		anim_y=0
		anim_xp=1
		anim_yp=0
	}

	if (x_control=0) and !(y_control=0) {
		anim_y=y_control
		anim_x=0
		anim_yp=1
		anim_xp=0
	}

	if !(x_control=0) and !(y_control=0) {
		anim_x=x_control*(anim_xp)
		anim_y=y_control*(anim_yp)
	}

	if x_control=0 and y_control=0 {
		anim_x=0
		anim_y=0
		image_index=1
		image_index_unlock=1
	}
	else if image_index_unlock {
		image_index=0
		image_index_unlock=0
	}

	if (x_moving=0) and (y_moving=0) image_index=1

	if anim_x=-1 sprite_index=s_kris_left
	if anim_x=1 sprite_index=s_kris_right
	if anim_y=-1 sprite_index=s_kris_up
	if anim_y=1 sprite_index=s_kris_down

	// debug

	if getkey("res") {
		x=mouse_x
		y=mouse_y
	}