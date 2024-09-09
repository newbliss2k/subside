var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

#region Battle

	selector=0
	
	selector_v2=[0,0]
	
	choice_group="enemy" // Can be "enemy", "party", "item" or "skill"
	choice_group_changable=0 // If true, allows switching choice_group between "enemy" and "party"
	
	turn_player=1
	turn_player_party=0
	
	party_actions=[]
	stat_sp_random=irandom_range(0,1)
	
	screen_start={
		name:"start",
		options:[
			{
				title: function(){return localize("battle_option_attack")},
				name:"attack",
				func: function(){
					with o_battle {
						screen=screen_choose_enemies
						screen.options=global.battle.enemies
						selector=0
						
						choice_group_changable=0
					}
				},
				sprite: s_battle_button_attack,
			},
			
			{
				title: function(){return localize("battle_option_skill")},
				name:"skill",
				func: function(){
					//o_battle.turn_player=0
				},
				sprite: s_battle_button_skill,
			},
			
			{
				title: function(){return localize("battle_option_action")},
				name:"action",
				func: function(){
					//o_battle.turn_player=0
				},
				sprite: s_battle_button_action,
			},
			
			{
				title: function(){return localize("battle_option_item")},
				name:"item",
				func: function(){
					//o_battle.turn_player=0
				},
				sprite: s_battle_button_item,
			},
		],
		nav:"h",
		
		d_mode:"bottom_bar",
		d_height:50,
		d_y:480,
		
	}
	
	screen_choose_enemies={
		name:"choose_enemies",
		options:[],
		nav:"h",
		
		d_mode:"empty",
		
	}
	
	screen_choose_party={
		name:"choose_party",
		options:[],
		nav:"4s",
		
		d_mode:"empty",
		
	}
	
	screen_choose_action={
		name:"choose_party",
		options:[],
		nav:"v",
		
		d_mode:"list_desk",
		
	}
	
	screen_choose_item={
		name:"choose_party",
		options:[],
		nav:"v",
		
		d_mode:"list_desk",
		
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
	
	d_lerp_speed=0.2
	d_round=5
	
	d_font_profile=font_poll
	d_font_stats=font_small
	
	sat=120
	val1=20
	val2=35
	
	d_enemy_select_border=10
	
	#region Bottom Bar
		
		d_bottom_bar_xmargin=160
		d_bottom_bar_yreserve=1
		d_bottom_bar_height=0
		
		d_bottom_bar_x1=d_bottom_bar_xmargin
		d_bottom_bar_x2=_guix-d_bottom_bar_xmargin
		d_bottom_bar_y1=_guiy+d_bottom_bar_yreserve
		d_bottom_bar_y2=_guiy+d_bottom_bar_yreserve
		
		d_bottom_bar_dbox=82
		
	#endregion
	
	#region Party Props Const

		d_border=20

		d_card_width=120
		d_card_height=160

		d_portrait_width=100 // Same as height
		d_portrait_x_border=(d_card_width-d_portrait_width)/2
		d_portrait_y_border=25

		d_bar_border=7
		d_bar_border_r=4
	
		d_bar_y=1
		
		d_portrait_blink=10
		d_portrait_blink_period=10
		
	#endregion
	
	#region Party Props Char
	
		var _d_party1 = {}
	
			_d_party1.card_x1=0+d_border
			_d_party1.card_x2=0+d_border+d_card_width
			_d_party1.card_y1=_guiy-d_border-d_card_height
			_d_party1.card_y2=_guiy-d_border
	
			_d_party1.portrait_x1=_d_party1.card_x1+d_portrait_x_border
			_d_party1.portrait_x2=_d_party1.portrait_x1+d_portrait_width
			_d_party1.portrait_y1=_d_party1.card_y1+d_portrait_y_border
			_d_party1.portrait_y2=_d_party1.portrait_y1+d_portrait_width
		
			_d_party1.bar_health=_d_party1.portrait_x1
			_d_party1.bar_mana=_d_party1.portrait_x1
	
		var _d_party2 = {}
	
			_d_party2.card_x1=_guix-d_border-d_card_width
			_d_party2.card_x2=_guix-d_border
			_d_party2.card_y1=_guiy-d_border-d_card_height
			_d_party2.card_y2=_guiy-d_border
	
			_d_party2.portrait_x1=_d_party2.card_x1+d_portrait_x_border
			_d_party2.portrait_x2=_d_party2.portrait_x1+d_portrait_width
			_d_party2.portrait_y1=_d_party2.card_y1+d_portrait_y_border
			_d_party2.portrait_y2=_d_party2.portrait_y1+d_portrait_width
		
			_d_party2.bar_health=_d_party2.portrait_x1
			_d_party2.bar_mana=_d_party2.portrait_x1
		
		var _d_party3 = {}
	
			_d_party3.card_x1=0+d_border
			_d_party3.card_x2=0+d_border+d_card_width
			_d_party3.card_y1=0+d_border
			_d_party3.card_y2=0+d_border+d_card_height
	
			_d_party3.portrait_x1=_d_party3.card_x1+d_portrait_x_border
			_d_party3.portrait_x2=_d_party3.portrait_x1+d_portrait_width
			_d_party3.portrait_y1=_d_party3.card_y1+d_portrait_y_border
			_d_party3.portrait_y2=_d_party3.portrait_y1+d_portrait_width
		
			_d_party3.bar_health=_d_party3.portrait_x1
			_d_party3.bar_mana=_d_party3.portrait_x1
		
		var _d_party4 = {}
	
			_d_party4.card_x1=_guix-d_border-d_card_width
			_d_party4.card_x2=_guix-d_border
			_d_party4.card_y1=0+d_border
			_d_party4.card_y2=0+d_border+d_card_height
	
			_d_party4.portrait_x1=_d_party4.card_x1+d_portrait_x_border
			_d_party4.portrait_x2=_d_party4.portrait_x1+d_portrait_width
			_d_party4.portrait_y1=_d_party4.card_y1+d_portrait_y_border
			_d_party4.portrait_y2=_d_party4.portrait_y1+d_portrait_width
		
			_d_party4.bar_health=_d_party4.portrait_x1
			_d_party4.bar_mana=_d_party4.portrait_x1
	
		d_party_props=[
			_d_party1,
			_d_party2,
			_d_party3,
			_d_party4,
		]
	
	#endregion
	
#endregion