if (global.osflavor != 4)
    instance_destroy()
_joy_rightp = 0
_joy_leftp = 0
_joy_upp = 0
_joy_downp = 0
dzdraw = 0
joybase_colour = 3158064
joystick_colour = 6908265
border=20
if (global.aspectratio <= 0.5625)
{
    zx = 854-164+border //476
    xx = 854-83+border //557
    cx = 854-2+border //638
    jx = 0
}
else
{
    zx = 854-253+border //387
    xx = 854-172+border //468
    cx = 854-91+border //549
    jx = 100
}
jy = 300
device_mouse_dbclick_enable(false)
aspectratio_previous = (window_get_height() / window_get_width())
global.controller_opacity=0.5
global.controller_deadzoner=0.5
global.joy_right=0
global.joy_down=0
global.joy_left=0
global.joy_up=0

virtual_key_z = virtual_key_add(zx, 347, 81, 93, 90)
virtual_key_x = virtual_key_add(xx, 308, 81, 93, 88)
virtual_key_c = virtual_key_add(cx, 269, 81, 93, 67)