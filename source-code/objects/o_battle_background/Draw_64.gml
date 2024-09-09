var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

if (hue>=hue_max) or (hue<=hue_min) hue_step=-hue_step
hue+=hue_step

if hue_s=-1 {
	color1 = make_color_hsv(hue,sat,val)
	public_hue=hue
}
else {
	color1 = make_color_hsv(hue_s,sat,val)
	public_hue=hue_s
}



if (stretch>=stretch_max) or (stretch<=stretch_min) stretch_step=-stretch_step
stretch+=stretch_step

draw_rectangle_color(
	0,
	0,
	_guix,
	_guiy+stretch,
	color1,
	color1,
	color2,
	color2,
	0
)

//draw_text(0,0,string(stretch))