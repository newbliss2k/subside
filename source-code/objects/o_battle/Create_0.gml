var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

#region Battle

	selector=0
	
	turn_player=1
	turn_player_party=0
	
	screen_start={
		name:"start",
		options:[
			{
				title: function(){return localize("battle_option_attack")},
				func: function(){
					o_battle.turn_player=0
				}
			},
			
			{
				title: function(){return localize("battle_option_item")},
				func: function(){
					//o_battle.turn_player=0
				}
			},
			
			{
				title: function(){return localize("battle_option_skill")},
				func: function(){
					//o_battle.turn_player=0
				}
			},
			
			{
				title: function(){return localize("battle_option_run")},
				func: function(){
					//o_battle.turn_player=0
				}
			},
		],
		nav_v:1,
		
		x_margin:-13,
		y_margin:10,
		x_text_margin:-10,
		y_text_margin:5,
		width:150,
		height:110,
		
	}
	
	battlefield_width=150
	battlefield_height=100
	
	battlefield_yoffset=100
	
	battlefield_x1=(_guix-battlefield_width)/2
	battlefield_y1=(_guiy-battlefield_height)/2+battlefield_yoffset
	battlefield_x2=(_guix+battlefield_width)/2
	battlefield_y2=(_guiy+battlefield_height)/2+battlefield_yoffset
	
	battlefield_border=5
	
	screen=screen_start
	
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

	var _d_party1 = {}
	
		_d_party1.card_x1=0+d_border
		_d_party1.card_x2=0+d_border+d_card_width
		_d_party1.card_y1=_guiy-d_border-d_card_height
		_d_party1.card_y2=_guiy-d_border
	
		_d_party1.portrait_x1=_d_party1.card_x1+d_portrait_x_border
		_d_party1.portrait_x2=_d_party1.portrait_x1+d_portrait_width
		_d_party1.portrait_y1=_d_party1.card_y1+d_portrait_y_border
		_d_party1.portrait_y2=_d_party1.portrait_y1+d_portrait_width
	
		_d_party1.screen_x1=_d_party1.portrait_x2
		_d_party1.screen_y1=_d_party1.card_y1+screen.y_margin
		_d_party1.screen_x2=_d_party1.portrait_x2
		_d_party1.screen_y2=_d_party1.card_y1+screen.y_margin+screen.height
	
	d_party_props=[
		_d_party1
	
	]
	
	draw_set_font(font_poll)
	var _s=screen.options[selector].title()
	var _w=string_width(_s)
	var _h=string_height(_s)
	
	d_selector_x1=screen.x_margin+d_party_props[selector].screen_x2-screen.width-d_portrait_width
	d_selector_x2=screen.x_margin+d_party_props[selector].screen_x2-screen.width-d_portrait_width+_w
	d_selector_y1=_h*selector+screen.y_text_margin
	d_selector_y2=_h*(selector+1)+screen.y_text_margin
	
	d_lerp_speed=0.2
	
#endregion