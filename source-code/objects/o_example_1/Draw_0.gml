//draw_wheel_bg(x,y,250,75,make_color_rgb(22,24,37),10,1) //50,15
draw_wheel(x,y,250,75,make_color_rgb(22,24,37),10,1)
draw_wheel_ext(x,y,250,75,circolor,hp,maxhp,10,90,false,1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_text(0,14,"FPSReal=" + string(fps_real))
draw_text(0,0,"FPS=" + string(fps))
draw_text(0,300,"hp=" + string(hp))

if hp <= 0 && !hit0 {
	circolor = c_redish
	hit0 = true
}

if keyboard_check(vk_lshift) && !hit0 {
	hp = clamp(hp-1,0,maxhp)
	draw_wheel_part(x,y,250,75,c_orangish,10,360*hp/maxhp+90-8,16,1)
}
else hp = clamp(hp+1,0,maxhp)
//draw_wheel_deg(x,y,250,75,c_orangish,10,360*hp/maxhp-8+90,360*hp/maxhp+8+90,1)
if hp == maxhp && hit0 then hit0 = false
if !hit0 then circolor = c_green

if keyboard_check_pressed(vk_escape) then game_end()
if keyboard_check_pressed(ord("R")) then game_restart()