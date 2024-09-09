x_moving=0
y_moving=0

scr_check_priorities()

if (!place_meeting(x+x_speed*x_control,y,o_solid)) and (x*2+x_speed*x_control>o_battle.battlefield_x1) and (x*2+x_speed*x_control<o_battle.battlefield_x2) {
	x+=x_speed*x_control
	x_moving=ceil(x_control)
}
else if !place_meeting(x+x_control,y,o_solid) and (x*2+x_speed*x_control>o_battle.battlefield_x1) and (x*2+x_speed*x_control<o_battle.battlefield_x2) {
	x+=x_control
	x_moving=ceil(x_control)
} else x_moving=0

// Y CONTROL

if !place_meeting(x,y+y_speed*y_control,o_solid) and (y*2+y_speed*y_control>o_battle.battlefield_y1) and (y*2+y_speed*y_control<o_battle.battlefield_y2) {
	y+=y_speed*y_control
	y_moving=ceil(y_control)
}
else if !place_meeting(x,y+y_control,o_solid) and (y*2+y_speed*y_control>o_battle.battlefield_y1) and (y*2+y_speed*y_control<o_battle.battlefield_y2) {
	y+=y_control
	y_moving=ceil(y_control)
} else y_moving=0

if iv_cooldown>0 {
	
	iv_cooldown--
	
	if iv_alpha_cd>0 iv_alpha_cd--
	else {
		
		iv_alpha_cd=iv_alpha_cd_period
		if iv_alpha=0.1 {
			iv_alpha=0.2
			o_battle_background.hue_s=0
		}
		else {
			iv_alpha=0.1
			o_battle_background.hue_s=240
		}
		
	}
	
}
else {
	
	iv_alpha=1
	o_battle_background.hue_s=-1
	iv_alpha_cd=0
	
	
}