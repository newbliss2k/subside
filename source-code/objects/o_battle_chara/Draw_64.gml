var _outline = 0.6

var _surface = surface_create(display_get_gui_width(),display_get_gui_height())
surface_set_target(_surface)

draw_sprite_ext(sprite_index,image_index,x*2+_outline,y*2,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2,y*2+_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2-_outline,y*2,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2,y*2-_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)

draw_sprite_ext(sprite_index,image_index,x*2+_outline,y*2+_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2+_outline,y*2-_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2-_outline,y*2+_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,image_index,x*2-_outline,y*2-_outline,image_xscale*2,image_yscale*2,0,c_white,image_alpha)

draw_sprite_ext(sprite_index,image_index,x*2,y*2,image_xscale*2,image_yscale*2,0,c_red,image_alpha)

draw_set_alpha(iv_alpha)
surface_reset_target()
draw_surface(_surface,0,0)
surface_free(_surface)