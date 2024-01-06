var _max_devices = 4;

for (var _i = 0; _i < _max_devices; _i++)
{
		var _touch_x = device_mouse_x_to_gui(_i);
		var _touch_y = device_mouse_y_to_gui(_i);
		
		var _ui_at_pos = instance_position(_touch_x, _touch_y, o_ui_parent);
		var _held = device_mouse_check_button(_i, mb_left);
		var _pressed = device_mouse_check_button_pressed(_i, mb_left)
		var _released = device_mouse_check_button_released(_i, mb_left)
		
		if (_ui_at_pos != noone && (_held or _pressed or _released))
		{
			_ui_at_pos._held=_held
			_ui_at_pos._pressed=_pressed
			_ui_at_pos._released=_held
			
		}
		
}