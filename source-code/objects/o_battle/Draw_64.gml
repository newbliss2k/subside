var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()
var _surf = surface_create(_guix,_guiy)
surface_set_target(_surf)

// Player's Party Props
for(var _i=0;_i<array_length(global.game.party);_i++) {
	
	// Card
		draw_set_alpha(1)
		draw_set_color(#bbbbbb)
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
	
	// Portrait
		draw_set_alpha(1)
		draw_set_color(0)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y1,
			d_party_props[_i].portrait_x2,
			d_party_props[_i].portrait_y2,
			d_round,
			d_round,
			0
		)
		
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_roundrect_ext(
			d_party_props[_i].portrait_x1,
			d_party_props[_i].portrait_y1,
			d_party_props[_i].portrait_x2,
			d_party_props[_i].portrait_y2,
			d_round,
			d_round,
			1
	)
	
	// Name
	draw_set_alpha(1)
	draw_set_color(0)
	draw_set_font(d_font_profile)
	
	draw_text(
		d_party_props[_i].portrait_x1+d_portrait_width/2-string_width(global.game.party[_i].display_name())/2,
		d_party_props[_i].portrait_y1-string_height(global.game.party[_i].display_name()),
		global.game.party[_i].display_name()
	)
	
	// Health Bar
		
		// Blackbar
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
		
		// Outline
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
		
		// Bar
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
		
	// Mana Bar
		
		// Blackbar
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
		
		// Outline
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
		
		// Bar
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
	
}

surface_reset_target()
draw_surface(_surf,0,0)
surface_free(_surf)