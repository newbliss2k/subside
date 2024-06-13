//draw_text(mouse_x,mouse_y,"x_moving: "+string(o_joystick_left._held)+"\ny_moving: "+string(joystick(o_joystick_right))+"\nanim_xp: "+string(anim_xp)+"\nanim_yp"+string(anim_yp))

//draw_self()
draw_sprite_ext(sprite_index,image_index,x,y,0.5,0.5,0,c_white,1)
draw_set_font(font_normal)
draw_text(20,20,"x: "+string(mouse_x)+"\ny: "+string(mouse_y))
//draw_sprite_ext(sprite_index,image_index,round(x),round(y),0.5,0.5,0,c_white,1)