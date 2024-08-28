function scr_init_battles(){
	
	global.battle={}
	with global.battle {
		
		enemies=[]
		
		#region ENEMIES
		enemy={
			
			knifeman:{
				
				
				
				name:"knifeman",
				display_name:"Pavel Durov",
				
				face:s_enemy_knifeman,
				
				stat_hp:10,
				stat_hp_max:10,
				
				state:"fight",
				
				create: function(){
					
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