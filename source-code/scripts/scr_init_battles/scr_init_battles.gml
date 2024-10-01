function scr_init_battles(){
	
	global.battle={}
	with global.battle {
		
		enemies=[]
		
		#region ENEMIES
		enemy={
			
			knifeman:{
				
				
				
				name:"knifeman",
				display_name: function(){return localize("enemy_durov")},
				
				face:s_enemy_knifeman,
				
				stat_hp:15,
				stat_hp_max:15,
				
				state:"fight",
				
				create: function(){
					turn_timer=60*10
					
					timer=random_range(30,60)
					
				},
				
				func: function(){
					
					timer--
					if timer<0 {
						
						timer=random_range(30,60)
						dir=random_range(0,360)
						create_range=random_range(80,90)
						instance_create_depth(
							o_battle_chara.x+dcos(dir)*create_range,
							o_battle_chara.y-dsin(dir)*create_range,
							o_battle.depth-1,
							o_ep_knife
						)
						
					}
					
				},
				
			},
			
		}
		#endregion
		
		#region GROUP
		group={
			
			knifeman:[
				global.battle.enemy.knifeman
			],
			
		}
		#endregion
	}
}

// usage: battle_encounter(global.battle.group._your_group)
function battle_encounter(_group){
	
	global.battle.enemies=_group
	room_goto(r_battle)
	
}

function next_turn() {
	
	with o_battle {
		screen=screen_start
		selector=0
		
		stat_sp_random=irandom_range(0,1)
		if turn_player_party++=array_length(global.game.party) {
			msg_text("Я не отдам вам коды шифрования,<timer=15><color=255> проклятые французы!<color/><timer=25> Viva La<color=16738816><wave=3=1><timer=15> Telegram!!!")
			//msg_text("Я не отдам вам коды шифрования, проклятые французы! Viva La Telegram!!!")
			msg_func(function(){
				turn_player_party=0
				turn_player=0
				party_actions=[]
			})
		}
	}
	
}

function count_weapon_damage() {
	
	return 2
	
}