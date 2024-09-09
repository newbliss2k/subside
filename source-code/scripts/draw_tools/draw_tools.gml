
function draw_line_width_color_ext(_x1,_y1,_x2,_y2,_width,_alpha){
	draw_sprite_pos(s_l,0,_x1-_width/2,_y1-_width/2,_x1-_width/2,_y1-_width/2,_x2-_width/2,_y2-_width/2,_x2-_width/2,_y2-_width/2,_alpha)
	
}

function draw_wheel_ext(_x, _y, _r, _roff, _color, _val, _maxval, _line_width, _ang, _cwise, _alpha) {

	// This script should be used to BE the progress bar(circle).

	var xx = _x
	var yy = _y
	var r = _r
	var roff = _roff
	var color = _color
	var val = _val
	var maxval = _maxval
	var line_width = _line_width
	var ang = _ang//clamp(argument8,0,360)
	var cwise = _cwise // Boolean. Determines wether the bar fills clock or counter clockwise. Logically, the bar will unfill from the opposite chosen way.

	if cwise then ang += 180

	while ang > 360 { ang -= 360 }
	while ang < 0 { ang += 360 }

	var deg = min(360 * (val/maxval),360) // If the value is higher than 360, we'll be drawing more than 1 circle, which would be useless

	var returnalpha = draw_get_alpha()
	draw_set_alpha(_alpha)
	draw_set_color(color)
	// This for loop is responsible for drawing the lines that make the circle
	if !cwise {
		for (var i= ang;i < (deg + ang);i++) {
			draw_line_width_color_ext(xx + lengthdir_x(roff,i),yy + lengthdir_y(roff,i),xx + lengthdir_x(r,i),yy + lengthdir_y(r,i),line_width,_alpha)
			draw_line_width_color(xx + lengthdir_x(roff,i),yy + lengthdir_y(roff,i),xx + lengthdir_x(r,i),yy + lengthdir_y(r,i),line_width,color,color)
			
		}
	}
	if cwise {
		for (var i= -1*ang;i > -1*(deg+ang);i--) {
			draw_line_width_color_ext(xx + lengthdir_x(roff,i),yy + lengthdir_y(roff,i),xx + lengthdir_x(r,i),yy + lengthdir_y(r,i),line_width,_alpha)
			draw_line_width_color(xx + lengthdir_x(roff,i),yy + lengthdir_y(roff,i),xx + lengthdir_x(r,i),yy + lengthdir_y(r,i),line_width,color,color)
		}
	}
	draw_set_alpha(returnalpha)


}

function draw_wheel(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	// This is a simplified version of draw_wheel_ext

	var xx = argument0
	var yy = argument1
	var r = argument2
	var roff = argument3
	var color = argument4
	var lwid = argument5
	var alpha = argument6

	draw_wheel_ext(xx,yy,r,roff,color,1,1,lwid,0,false,alpha)


}
function draw_wheel_part(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	// This scrpit draws an arc

	var xx = argument0
	var yy = argument1
	var r = argument2
	var roff = argument3
	var color = argument4
	var lwid = argument5
	var sang = argument6
	var anglen = argument7
	// alpha argument8

	draw_wheel_ext(x,y,r,roff,color,anglen,360,lwid,sang,false,argument8)


}


