function scr_init_battles(){
	
	global.battle={}
	with global.battle {
		
		enemies=[]
		
		#region ENEMIES
		enemy={
			
			test:{
				
				stat_hp:10,
				stat_hp_max:10,
				
				state:"fight"
				
			},
			
		}
		#endregion
		
		#region GROUP
		group={
			
			test:[
				global.battle.enemy
			],
			
		}
		#endregion
	}
}

// usage: battle_encounter(global.battle.group._your_group)
function battle_encounter(_group){
	
	global.battle.enemies=_group
	
}