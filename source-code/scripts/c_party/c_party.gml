function c_party(){
	
	global.c.classes = {}
	with global.c.classes {
		
		soldier = {}
		with soldier {
			
			name = "soldier"
			display_name = 
		}
		
	}
	
	global.c.party = [
		
		{
			name: "carol",
			display_name: function(){return localize("party_name_carol")},
			
			face:s_party_carol,
			
			stat_lv: 1,
			
			stat_hp: 20,
			stat_hp_max: 20,
			
			stat_mn: 10,
			stat_mn_max: 10,
			
			stat_sp: 4,
			stat_atk: 5,
			
			eq_armor: "",
			eq_weapon: "",
		},
		
		{
			name: "jean",
			display_name: function(){return localize("party_name_jean")},
			
			face:s_party_carol,
			
			stat_lv: 1,
			stat_hp: 20,
			stat_hp_max: 20,
			stat_mn: 10,
			stat_mn_max: 10,
			
			stat_sp: 10,
			stat_atk: 2,
			
			eq_armor: "",
			eq_weapon: "",
		},
		
		{
			name: "hamlet",
			display_name: function(){return localize("party_name_hamlet")},
			
			face:s_party_carol,
			
			stat_lv: 1,
			stat_hp: 20,
			stat_hp_max: 20,
			stat_mn: 10,
			stat_mn_max: 10,
			
			stat_sp: 2,
			stat_atk: 2,
			
			eq_armor: "",
			eq_weapon: "",
		},
		
		{
			name: "eugenia",
			display_name: function(){return localize("party_name_eugenia")},
			
			face:s_party_carol,
			
			stat_lv: 1,
			stat_hp: 20,
			stat_hp_max: 20,
			stat_mn: 10,
			stat_mn_max: 10,
			
			stat_sp: 1,
			stat_atk: 2,
			
			eq_armor: "",
			eq_weapon: "",
		},
		
	]
	
}