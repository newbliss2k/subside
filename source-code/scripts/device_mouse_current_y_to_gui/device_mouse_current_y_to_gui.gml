function device_mouse_current_y_to_gui(){
if device_mouse_check_button(0, mb_left)
    return device_mouse_y_to_gui(0);
if device_mouse_check_button(1, mb_left)
    return device_mouse_y_to_gui(1);
if device_mouse_check_button(2, mb_left)
    return device_mouse_y_to_gui(2);
if device_mouse_check_button(3, mb_left)
    return device_mouse_y_to_gui(3);
if device_mouse_check_button(4, mb_left)
    return device_mouse_y_to_gui(4);

return 0

}

