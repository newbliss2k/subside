function draw_text_outline(_x,_y,_text,_width=2,_outline_color=0,_text_color=draw_get_color()){
	
	//Outline
	//var _s = surface_create(display_get_gui_width(),display_get_gui_height())
	//surface_set_target(_s)
	
	draw_set_color(_outline_color)
	draw_text(_x+_width,_y+_width,_text)
	draw_text(_x-_width,_y-_width,_text)
	draw_text(_x,_y+_width,_text)
	draw_text(_x+_width,_y,_text)
	draw_text(_x,_y-_width,_text)
	draw_text(_x-_width,_y,_text)
	draw_text(_x-_width,_y+_width,_text)
	draw_text(_x+_width,_y-_width,_text)
	
	//Text
	draw_set_color(_text_color)
	//draw_text(_x,_y,_text)
	
	
	//surface_reset_target()
	//draw_surface(_s,0,0)
	//surface_free(_s)
	
}