

draw_set_alpha(poll_rect_alpha)
		
		draw_set_color(0)
		draw_roundrect(__poll_rect_x1,__poll_rect_y1,__poll_rect_x2,__poll_rect_y2,0)
		draw_set_alpha(poll_rect_alpha*0.2)
		draw_set_color(c_white)
		draw_roundrect(__poll_rect_x1,__poll_rect_y1,__poll_rect_x2,__poll_rect_y2,1)

if (blink--)<1 {
	blink=blink_def
	if (rep--)<1 selector=0
}
if rep mod 2 poll_selector_alpha=1
else poll_selector_alpha=0.3

if selector {

	draw_set_font(font_poll)

	if ir draw_set_color(c_red)
	else draw_set_color(c_white)
		
			draw_set_alpha(0.2*poll_selector_alpha)
			draw_roundrect(poll_s_x1,poll_s_y1,poll_s_x2,poll_s_y2,0)
			draw_set_alpha(0.7*poll_selector_alpha)
			draw_roundrect(poll_s_x1,poll_s_y1,poll_s_x2,poll_s_y2,1)

	draw_set_alpha(poll_selector_alpha)
	draw_text(poll_x,poll_y+poll_selector*(poll_string_height)-poll_offset,text)
	
} else {
	
	poll_rect_alpha=lerp(poll_rect_alpha,0,0.2)
	if poll_rect_alpha=0 instance_destroy()
	
}