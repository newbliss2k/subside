var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()
var _surf = surface_create(_guix,_guiy)

bktglitch_deactivate()
surface_set_target(_surf)

// Player's Party Props
for(var _i=0;_i<array_length(global.game.party);_i++) {
	
	#region Face
		// We should draw face on default surface
		surface_reset_target()
	
		draw_set_alpha(1)
		draw_set_color(#bbbbbb)
		bktglitch_activate()
		draw_sprite(
			global.game.party[_i].face,
			-1,
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y1
		)
		bktglitch_deactivate()
	
		surface_set_target(_surf)
	#endregion
	
	#region Screen
		
		switch screen.name {
			
			case "start":
				if turn_player and turn_player_party=_i {
					d_party_props[_i].screen_x1=lerp(d_party_props[_i].screen_x1,d_party_props[_i].portrait_x2,d_lerp_speed)
					d_party_props[_i].screen_y1=lerp(d_party_props[_i].screen_y1,d_party_props[_i].card_y1+screen.y_margin,d_lerp_speed)
					d_party_props[_i].screen_x2=lerp(d_party_props[_i].screen_x2,d_party_props[_i].portrait_x2+screen.width,d_lerp_speed)
					d_party_props[_i].screen_y2=lerp(d_party_props[_i].screen_y2,d_party_props[_i].card_y1+screen.y_margin+screen.height,d_lerp_speed)
				}
				else {
					d_party_props[_i].screen_x1=lerp(d_party_props[_i].screen_x1,d_party_props[_i].portrait_x2,d_lerp_speed)
					d_party_props[_i].screen_y1=lerp(d_party_props[_i].screen_y1,d_party_props[_i].card_y1+screen.y_margin,d_lerp_speed)
					d_party_props[_i].screen_x2=lerp(d_party_props[_i].screen_x2,d_party_props[_i].portrait_x2,d_lerp_speed)
					d_party_props[_i].screen_y2=lerp(d_party_props[_i].screen_y2,d_party_props[_i].card_y1+screen.y_margin+screen.height,d_lerp_speed)
				}
			
		}
		
		draw_set_alpha(1)
		draw_set_color(0)
		draw_roundrect_ext(
			d_party_props[_i].screen_x1,
			d_party_props[_i].screen_y1,
			d_party_props[_i].screen_x2,
			d_party_props[_i].screen_y2,
			d_round,
			d_round,
			0
		)
		
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_party_props[_i].screen_x1,
			d_party_props[_i].screen_y1,
			d_party_props[_i].screen_x2,
			d_party_props[_i].screen_y2,
			d_round,
			d_round,
			1
		)
		
		var _text_surface=surface_create(screen.width,screen.height)
		surface_reset_target()
		surface_set_target(_text_surface)
		
		draw_set_font(font_poll)
		
		var _s=screen.options[selector].title()
		var _w=string_width(_s)
		var _h=string_height(_s)
		
		d_selector_x1=lerp(d_selector_x1,screen.x_margin+d_party_props[_i].screen_x2-screen.width-d_portrait_width,d_lerp_speed)
		d_selector_x2=lerp(d_selector_x2,screen.x_margin+d_party_props[_i].screen_x2-screen.width-d_portrait_width+_w,d_lerp_speed)
		d_selector_y1=lerp(d_selector_y1,_h*selector+screen.y_text_margin,d_lerp_speed)
		d_selector_y2=lerp(d_selector_y2,_h*(selector+1)+screen.y_text_margin,d_lerp_speed)
		
		draw_set_alpha(0.65)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_selector_x1,
			d_selector_y1,
			d_selector_x2,
			d_selector_y2,
			d_round,
			d_round,
			0
		)
		
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_selector_x1,
			d_selector_y1,
			d_selector_x2,
			d_selector_y2,
			d_round,
			d_round,
			1
		)
		
		for(var __i=0;__i<array_length(screen.options);__i++) {
			draw_set_font(font_poll)
			var __s=screen.options[__i].title()
			var __w=string_width(__s)
			var __h=string_height(__s)
			
			draw_set_alpha(1)
			draw_set_color(c_white)
			draw_text(screen.x_text_margin+d_party_props[_i].screen_x2-screen.width-d_portrait_width,__h*__i+screen.y_text_margin,__s)
			
		}
		
		surface_reset_target()
		surface_set_target(_surf)
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_surface(_text_surface,d_party_props[_i].portrait_x2,d_party_props[_i].screen_y1)
		surface_free(_text_surface)
	
	#endregion
	
	#region Card
		draw_set_alpha(1)
		draw_set_color(#cccccc)
		draw_roundrect_ext(
			d_party_props[_i].card_x1,
			d_party_props[_i].card_y1,
			d_party_props[_i].card_x2,
			d_party_props[_i].card_y2,
			d_round,
			d_round,
			0
		)
		
		draw_set_alpha(1)
		draw_set_color(c_black)
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
	
	#region Portrait
		gpu_set_blendmode(bm_subtract)
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y1,
			d_party_props[_i].portrait_x2,
			d_party_props[_i].portrait_y2,
			d_round,
			d_round,
			0
		)
		gpu_set_blendmode(bm_normal)
		
		draw_set_alpha(1)
		draw_set_color(c_black)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y1,
			d_party_props[_i].portrait_x2,
			d_party_props[_i].portrait_y2,
			d_round,
			d_round,
			1
		)
	#endregion
	
	#region Name
		draw_set_alpha(1)
		draw_set_color(0)
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
				d_party_props[_i].portrait_y2+d_bar_border,
				d_party_props[_i].portrait_x2,
				d_party_props[_i].portrait_y2+d_bar_border*2,
				d_round,
				d_round,
				0
			)
		#endregion
		#region Outline
			draw_set_alpha(1)
			draw_set_color(0)
			draw_roundrect_ext(
				d_party_props[_i].portrait_x1,
				d_party_props[_i].portrait_y2+d_bar_border,
				d_party_props[_i].portrait_x2,
				d_party_props[_i].portrait_y2+d_bar_border*2,
				d_round,
				d_round,
				1
			)
		#endregion
		#region Bar
			draw_set_alpha(1)
			draw_set_color(c_red)
			draw_roundrect_ext(
				d_party_props[_i].portrait_x1,
				d_party_props[_i].portrait_y2+d_bar_border,
				d_party_props[_i].portrait_x1+d_portrait_width*global.game.party[_i].stat_hp/global.game.party[_i].stat_hp_max,
				d_party_props[_i].portrait_y2+d_bar_border*2,
				d_round,
				d_round,
				0
			)
		#endregion
		
	#endregion
	
	#region Mana Bar
		
		#region Back
			draw_set_alpha(1)
			draw_set_color(0)
			draw_roundrect_ext(
				d_party_props[_i].portrait_x1,
				d_party_props[_i].portrait_y2+d_bar_border*3,
				d_party_props[_i].portrait_x2,
				d_party_props[_i].portrait_y2+d_bar_border*4,
				d_round,
				d_round,
				0
			)
		#endregion
		#region Outline
		draw_set_alpha(1)
		draw_set_color(0)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y2+d_bar_border*3,
			d_party_props[_i].portrait_x2,
			d_party_props[_i].portrait_y2+d_bar_border*4,
			d_round,
			d_round,
			1
		)
		#endregion
		#region Bar
		draw_set_alpha(1)
		draw_set_color(c_blue)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y2+d_bar_border*3,
			d_party_props[_i].portrait_x1+d_portrait_width*global.game.party[_i].stat_mn/global.game.party[_i].stat_mn_max,
			d_party_props[_i].portrait_y2+d_bar_border*4,
			d_round,
			d_round,
			0
		)
		#endregion
		
	#endregion
}

for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
	
	draw_sprite(
		global.battle.enemies[_i].face,
		-1,
		_guix/2, //global.battle.enemies[_i].draw_x,
		_guiy/2+40 //global.battle.enemies[_i].draw_y
	)
	
}

if turn_player {
	
}
else {
	
	#region Battlefield
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
	#endregion
	
}

bktglitch_activate()
surface_reset_target()
//draw_surface(application_surface,0,0)
draw_surface(_surf,0,0)
surface_free(_surf)