var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

#region Party Props 
	
	for(var _i=0;_i<array_length(global.game.party);_i++) {
	
		#region Card
			draw_set_alpha(1)
			draw_set_color(0)
			var _card_color1=0
			var _card_color2=0
			if turn_player_party=_i if d_portrait_blink--<0 d_portrait_blink=d_portrait_blink_period*2
			if (d_portrait_blink>d_portrait_blink_period) and (turn_player_party=_i) and (turn_player=1) {
				_card_color1=make_color_hsv(o_battle_background.public_hue,180,10)
				if screen.name="choose_party" _card_color2=make_color_hsv(100,180,140)
				else _card_color2=make_color_hsv(0,180,140)
			}
			else {
				_card_color1=make_color_hsv(o_battle_background.public_hue,sat,val1)
				_card_color2=make_color_hsv(o_battle_background.public_hue,sat,val2)
			}
			draw_roundrect_color_ext(
				d_party_props[_i].card_x1,
				d_party_props[_i].card_y1,
				d_party_props[_i].card_x2,
				d_party_props[_i].card_y2,
				d_round,
				d_round,
				_card_color1,
				_card_color2,
				0
			)
		
			draw_set_alpha(1)
			draw_set_color(c_white)
			draw_roundrect_ext(
				d_party_props[_i].card_x1,
				d_party_props[_i].card_y1,
				d_party_props[_i].card_x2,
				d_party_props[_i].card_y2,
				d_round,
				d_round,
				1
			)
		#endregion
	
		#region Face
	
			draw_set_alpha(1)
			draw_set_color(#bbbbbb)
			draw_sprite(
				global.game.party[_i].face,
				-1,
				d_party_props[_i].portrait_x1,
				d_party_props[_i].portrait_y1
			)
		#endregion
	
		#region Name
			draw_set_alpha(1)
			draw_set_color(c_white)
			draw_set_font(d_font_profile)
	
			draw_text(
				d_party_props[_i].portrait_x1+d_portrait_width/2-string_width(global.game.party[_i].display_name())/2,
				d_party_props[_i].portrait_y1-string_height(global.game.party[_i].display_name()),
				global.game.party[_i].display_name()
			)
		#endregion
	
		#region Health Bar
		
			#region Back
				draw_set_alpha(1)
				draw_set_color(0)
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border-d_bar_y,
					d_party_props[_i].portrait_x2,
					d_party_props[_i].portrait_y2+d_bar_border*2+d_bar_y,
					d_round*2,
					d_round*2,
					0
				)
			#endregion
			#region Bar
				draw_set_alpha(1)
				draw_set_color(c_red)
			
				d_party_props[_i].bar_health=lerp(
					d_party_props[_i].bar_health,
					d_party_props[_i].portrait_x1+(d_portrait_width)*global.game.party[_i].stat_hp/global.game.party[_i].stat_hp_max,
					d_lerp_speed*0.4
				)
			
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border-d_bar_y,
					d_party_props[_i].bar_health,
					d_party_props[_i].portrait_y2+d_bar_border*2+d_bar_y,
					d_round*2,
					d_round*2,
					0
				)
			#endregion
			#region Outline
				draw_set_alpha(1)
				draw_set_color(c_white)
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border-d_bar_y,
					d_party_props[_i].portrait_x2,
					d_party_props[_i].portrait_y2+d_bar_border*2+d_bar_y,
					d_round*2,
					d_round*2,
					2
				)
			#endregion
		
			#region Text
			
				draw_set_font(font_stats)
				var _s_hp = string(global.game.party[_i].stat_hp)+"/"+string(global.game.party[_i].stat_hp_max)
				var _w_s_hp = string_width(_s_hp)
			
				draw_set_alpha(1)
				draw_set_color(0)
				draw_text_outline(d_party_props[_i].portrait_x2-_w_s_hp,d_party_props[_i].portrait_y2+d_bar_border-1,_s_hp,0.5,0,c_white)
				draw_set_color(c_white)
				draw_text(d_party_props[_i].portrait_x2-_w_s_hp,d_party_props[_i].portrait_y2+d_bar_border-1,_s_hp)
			
			#endregion
		
		#endregion
	
		#region Mana Bar
		
			#region Back
				draw_set_alpha(1)
				draw_set_color(0)
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border*3-d_bar_y,
					d_party_props[_i].portrait_x2,
					d_party_props[_i].portrait_y2+d_bar_border*4+d_bar_y,
					d_round*2,
					d_round*2,
					0
				)
			#endregion
			#region Bar
				draw_set_alpha(1)
				draw_set_color(c_blue)
			
				d_party_props[_i].bar_mana=lerp(
					d_party_props[_i].bar_mana,
					d_party_props[_i].portrait_x1+(d_portrait_width)*global.game.party[_i].stat_mn/global.game.party[_i].stat_mn_max,
					d_lerp_speed*0.4
				)
			
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border*3-d_bar_y,
					d_party_props[_i].bar_mana,
					d_party_props[_i].portrait_y2+d_bar_border*4+d_bar_y,
					d_round*2,
					d_round*2,
					0
				)
			#endregion
		
			#region Text
			
				draw_set_font(font_stats)
				var _s_mn = string(global.game.party[_i].stat_mn)+"/"+string(global.game.party[_i].stat_mn_max)
				var _w_s_mn = string_width(_s_mn)
			
				draw_set_alpha(1)
				draw_set_color(0)
				draw_text_outline(d_party_props[_i].portrait_x2-_w_s_mn,d_party_props[_i].portrait_y2+d_bar_border*3-1,_s_mn,0.5,0,c_white)
				draw_set_color(c_white)
				draw_text(d_party_props[_i].portrait_x2-_w_s_mn,d_party_props[_i].portrait_y2+d_bar_border*3-1,_s_mn)
			
			#endregion
			#region Outline
				draw_set_alpha(1)
				draw_set_color(c_white)
				draw_roundrect_ext(
					d_party_props[_i].portrait_x1,
					d_party_props[_i].portrait_y2+d_bar_border*3-d_bar_y,
					d_party_props[_i].portrait_x2,
					d_party_props[_i].portrait_y2+d_bar_border*4+d_bar_y,
					d_round*2,
					d_round*2,
					1
				)
			#endregion
		
		#endregion
	
	}

#endregion

#region Option Screen
	
	#region Bottom Bar
		if global.game.mode="dialogue" or turn_player_party>=array_length(global.game.party) d_bottom_bar_height=lerp(d_bottom_bar_height,-d_bottom_bar_dbox-d_bottom_bar_yreserve,d_lerp_speed)
		else if screen.d_mode="bottom_bar" and turn_player d_bottom_bar_height=lerp(d_bottom_bar_height,-screen.d_height-d_bottom_bar_yreserve,d_lerp_speed)
		else d_bottom_bar_height=lerp(d_bottom_bar_height,0,d_lerp_speed)
		
		draw_set_alpha(1)
		draw_set_color(0)
		draw_roundrect_color_ext(
			d_bottom_bar_x1,
			d_bottom_bar_y1+d_bottom_bar_height,
			d_bottom_bar_x2,
			d_bottom_bar_y2,
			d_round,
			d_round,
			0,
			0,
			0
		)
			
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_bottom_bar_x1,
			d_bottom_bar_y1+d_bottom_bar_height,
			d_bottom_bar_x2,
			d_bottom_bar_y2,
			d_round,
			d_round,
			1
		)
		
	#endregion
	
	#region Start Screen
		
		if screen.name="start" and turn_player and !(global.game.mode="dialogue") screen_start.d_y=lerp(screen_start.d_y,440,d_lerp_speed)
		else screen_start.d_y=lerp(screen_start.d_y,490,d_lerp_speed)
		
		for(var _i=0;_i<array_length(screen_start.options);_i++) {
			
			if screen_start.options[_i].name="attack" draw_set_color(#D92B3D) else draw_set_color(#C5823E)
			
			draw_set_alpha(0.05+0.05*(_i=selector))
			draw_roundrect_ext(
				170+_i*131,
				screen_start.d_y,
				170+_i*131+121,
				screen_start.d_y+30,
				d_round,
				d_round,
				0
			)
			
			draw_set_alpha(0.1+0.5*(_i=selector))
			draw_roundrect_ext(
				170+_i*131,
				screen_start.d_y,
				170+_i*131+121,
				screen_start.d_y+30,
				d_round,
				d_round,
				1
			)
			
			draw_sprite_ext(
				screen_start.options[_i].sprite,
				0,
				170+_i*131,
				screen_start.d_y,
				1,
				1,
				0,
				c_white,
				0.1+0.5*(_i=selector)
			)
			
		}
		
	#endregion
	
#endregion

#region Enemy Draw
	for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
		
		var _face = global.battle.enemies[_i].face
		var _w = sprite_get_width(_face)
		var _h = sprite_get_height(_face)
		
		var _x = _guix/2
		var _y = _guiy/2+40
	
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_sprite(
			_face,
			-1,
			_x, //global.battle.enemies[_i].draw_x,
			_y //global.battle.enemies[_i].draw_y
		)
		
		if screen.name="choose_enemies" {
			
			draw_set_font(font_poll)
			
			draw_set_color(c_white)
			
			draw_set_alpha(0.1)
			draw_roundrect_ext(
				_x - _w/2 - d_enemy_select_border,
				_y - _h - d_enemy_select_border,
				_x + _w/2 + d_enemy_select_border,
				_y + d_enemy_select_border,
				d_round,
				d_round,
				0
			)
			
			draw_set_alpha(1)
			draw_roundrect_ext(
				_x - _w/2 - d_enemy_select_border,
				_y - _h - d_enemy_select_border,
				_x + _w/2 + d_enemy_select_border,
				_y + d_enemy_select_border,
				d_round,
				d_round,
				1
			)
			
			var _text_s = global.battle.enemies[_i].display_name()
			var _text_w = string_width(_text_s)
			var _text_h = string_height(_text_s)
			
			draw_set_alpha(0.3)
			draw_set_color(0)
			draw_roundrect_ext(
				_x - _text_w/2 - d_enemy_select_border,
				_y - _h - _text_h - d_enemy_select_border*5,
				_x + _text_w/2 + d_enemy_select_border,
				_y - _h - d_enemy_select_border*2,
				d_round,
				d_round,
				0
			)
			
			draw_set_alpha(1)
			draw_set_color(c_white)
			draw_roundrect_ext(
				_x - _text_w/2 - d_enemy_select_border,
				_y - _h - _text_h - d_enemy_select_border*5,
				_x + _text_w/2 + d_enemy_select_border,
				_y - _h - d_enemy_select_border*2,
				d_round,
				d_round,
				1
			)
			
			draw_text(_x - _text_w/2,_y - _h - _text_h - d_enemy_select_border*4.5,_text_s)
			
			#region Health Bar
				
				var _enemy_health = global.battle.enemies[_i].stat_hp/global.battle.enemies[_i].stat_hp_max
				
				#region Back
					draw_set_alpha(1)
					draw_set_color(0)
					draw_roundrect_ext(
						_x - _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border*2-d_bar_y-1,
						_x + _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border-d_bar_y+1,
						d_round*1.5,
						d_round*1.5,
						0
					)
				#endregion
				#region Bar
					draw_set_alpha(1)
					draw_set_color(c_red)
			
					draw_roundrect_ext(
						_x - _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border*2-d_bar_y-1,
						_x + _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border-d_bar_y+1,
						d_round*1.5,
						d_round*1.5,
						0
					)
				#endregion
				#region Outline
					draw_set_alpha(1)
					draw_set_color(c_white)
					draw_roundrect_ext(
						_x - _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border*2-d_bar_y-1,
						_x + _text_w/2,
						_y - _h - d_enemy_select_border*2 - d_bar_border-d_bar_y+1,
						d_round*1.5,
						d_round*1.5,
						2
					)
				#endregion
		
				#region Text
			
					draw_set_font(font_stats)
					var _s_hp = string(global.battle.enemies[_i].stat_hp)+"/"+string(global.battle.enemies[_i].stat_hp_max)
					var _w_s_hp = string_width(_s_hp)
			
					draw_set_alpha(1)
					draw_set_color(0)
					draw_text_outline(_x + _text_w/2-_w_s_hp,_y - _h - d_enemy_select_border*2 - d_bar_border*2-d_bar_y,_s_hp,0.5,0,c_white)
					draw_set_color(c_white)
					draw_text(_x + _text_w/2-_w_s_hp,_y - _h - d_enemy_select_border*2 - d_bar_border*2-d_bar_y,_s_hp)
			
				#endregion
		
			#endregion
			
		}
	
	}
#endregion

#region Battlefield
	if turn_player=0 {
		draw_set_alpha(1)
		draw_set_color(0)
		draw_roundrect_ext(
			battlefield_x1-battlefield_border,
			battlefield_y1-battlefield_border,
			battlefield_x2+battlefield_border-2,
			battlefield_y2+battlefield_border-2,
			10,
			10,
			0
		)
	
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			battlefield_x1-battlefield_border,
			battlefield_y1-battlefield_border,
			battlefield_x2+battlefield_border-2,
			battlefield_y2+battlefield_border-2,
			10,
			10,
			1
		)
		
		
	
	}
#endregion

#region Debug
	draw_text(0,0,string(device_mouse_x_to_gui(0)))
	draw_text(0,10,string(device_mouse_y_to_gui(0)))
#endregion