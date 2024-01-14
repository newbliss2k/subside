function device_mouse_check_any(){
if (device_mouse_check_button(0, mb_left) || device_mouse_check_button(1, mb_left) || device_mouse_check_button(2, mb_left) || device_mouse_check_button(3, mb_left) || device_mouse_check_button(4, mb_left))
    return 1;
else
    return 0;

}