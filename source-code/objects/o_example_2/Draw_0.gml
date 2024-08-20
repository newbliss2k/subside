draw_wheel_ext(x,y,100,98,c_white,hp,maxhp,10,90,clockwise,1)
hp = clockwise ? clamp(hp-2,0,200) : clamp(hp+2,0,200);
if (hp == maxhp && !clockwise) || (hp == 0 && clockwise) then clockwise = not clockwise

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x,y,"LOADING")