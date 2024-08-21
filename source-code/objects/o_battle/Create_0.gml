#region Battle
	
	turn_player=1
	turn_player_party=1
	
#endregion

#region Draw GUI

	d_border=20

	d_card_width=120
	d_card_height=160

	d_portrait_width=100 // Same as height
	d_portrait_x_border=(d_card_width-d_portrait_width)/2
	d_portrait_y_border=25

	d_bar_border=7

	d_font_profile=font_poll
	d_font_stats=font_small

	d_round=5

	var _guix = display_get_gui_width()
	var _guiy = display_get_gui_height()

	var _d_party1 = {}
	
		_d_party1.card_x1=0+d_border
		_d_party1.card_x2=0+d_border+d_card_width
		_d_party1.card_y1=_guiy-d_border-d_card_height
		_d_party1.card_y2=_guiy-d_border
	
		_d_party1.portrait_x1=_d_party1.card_x1+d_portrait_x_border
		_d_party1.portrait_x2=_d_party1.portrait_x1+d_portrait_width
		_d_party1.portrait_y1=_d_party1.card_y1+d_portrait_y_border
		_d_party1.portrait_y2=_d_party1.portrait_y1+d_portrait_width
	
	

	d_party_props=[
		_d_party1
	
	]
	
#endregion