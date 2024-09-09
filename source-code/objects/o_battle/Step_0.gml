randomize()

var _guix = display_get_gui_width()
var _guiy = display_get_gui_height()

if global.game.mode="dialogue" {
	
	
	
}
else {
	
	#region Player's Turn
		if turn_player {
		
			#region Options Navigation
				if turn_player_party<array_length(global.game.party) {
					if (screen.nav="v") or (screen.nav="h") {
						if (getkey("up",pressed) and screen.nav="v") or (getkey("left",pressed) and screen.nav="h") {
							selector--
							if selector<0 selector=-1+array_length(screen.options)
							
							audio_play_sound(sfx_ui_select1,1,0,0.25)
						}
						
						if (getkey("down",pressed) and screen.nav="v") or (getkey("right",pressed) and screen.nav="h") {
							selector++
							if selector>=array_length(screen.options) selector=0
							
							audio_play_sound(sfx_ui_select1,1,0,0.25)
						}
					}
					
					if (screen.nav="4s") {
						if getkey("up") or getkey("down") selector_v2[1]=!selector_v2[1]
						if getkey("left") or getkey("right") selector_v2[0]=!selector_v2[0]
						
						if selector_v2[0] if selector_v2[1] selector=4 else selector=2
						else if selector_v2[1] selector=3 else selector=1
						
						if selector>=array_length(global.game.party) {
							selector=0
							selector_v2=[0,0]
						}
					}
					
					if getkey("ok",pressed) switch screen.name {
						case "start":
							screen.options[selector].func()
							selector=0
							audio_play_sound(sfx_ui_select2,1,0,0.25)
						break
						
						case "choose_enemies":
							array_push(party_actions,{
								action:"attack",
								object:turn_player_party,
								subject:selector
							})
							selector=0
							audio_play_sound(sfx_ui_select2,1,0,0.25)
							next_turn()
						break
					}
					
					if getkey("back",pressed) switch screem.name {
						case "":
							break
						
					}
				}
			#endregion
	
		}
	#endregion
	
	#region Player's Actions
		
		if turn_player_party>=array_length(global.game.party) {
			
			var _stat_sp_max = 0
			var _stat_sp_max_party = 0
			for(var _i=0;_i<array_length(party_actions);_i++) if (global.game.party[_i].stat_sp>_stat_sp_max) or ((global.game.party[_i].stat_sp=_stat_sp_max) and stat_sp_random) {
				_stat_sp_max = global.game.party[_i].stat_sp
				_stat_sp_max_party = _i
			}
			
			if array_length(party_actions)<1 {
				next_turn()
			}
			else {
				var _a = party_actions[_stat_sp_max_party]
				switch _a.action {
				
					case "attack":
						//var _damage_range = irandom_range(0,1)
						var _damage_multi
						var _damage_type = irandom_range(0,20)
						if _damage_type = 0 {
							_damage_type = "fail"
							_damage_multi = 0
						}
						else if _damage_type < 6 {
							_damage_type = "weak"
							_damage_multi = 0.6
						}
						else if _damage_type < 17 {
							_damage_type = "default"
							_damage_multi = 1
						}
						else {
							_damage_type = "crit"
							_damage_multi = 1.5
						}
					
						var _damage = global.game.party[_a.object].stat_atk
					
						_damage = round(_damage*_damage_multi)
						
						global.battle.enemies[_a.subject].stat_hp-=_damage
					
						var _msg1 = localize("battle_attack_message_"+global.game.party[_a.object].eq_weapon)
						_msg1 =	string_replace(_msg1,"%CHAR%",global.game.party[_a.object].display_name())
						_msg1 =	string_replace(_msg1,"%ENEMY%",global.battle.enemies[_a.subject].display_name())
						_msg1 =	string_replace(_msg1,"%DAMAGE%",_damage)
					
						var _msg2 = localize("battle_attack_"+_damage_type)
						_msg2 =	string_replace(_msg2,"%CHAR%",global.game.party[_a.object].display_name())
						_msg2 =	string_replace(_msg2,"%ENEMY%",global.battle.enemies[_a.subject].display_name())
						_msg2 =	string_replace(_msg2,"%DAMAGE%",_damage)
					
						msg_text(_msg1+"<timer=30>/n"+_msg2,0)
						break
				
				}
				array_delete(party_actions,_stat_sp_max_party,1)
			}
			
		}
		
	#endregion
	
	#region Enemy's turn
		if turn_player=0 {
	
			if instance_exists(o_battle_chara) {
		
		
		
			}
			else {
		
				instance_create_depth(room_width/2,room_height/2+battlefield_yoffset/2,depth-1,o_battle_chara)
		
				for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
		
					global.battle.enemies[_i].create()
		
				}
		
			}
	
			for(var _i=0;_i<array_length(global.battle.enemies);_i++) {
		
				global.battle.enemies[_i].turn_timer--
				global.battle.enemies[_i].func()
		
				if global.battle.enemies[_i].turn_timer<=0 {
			
					instance_destroy(o_battle_chara)
					instance_destroy(o_ep)
					turn_player=1
					turn_player_party=0
					break
		
				}
		
			}
	
		}
	#endregion
	
}