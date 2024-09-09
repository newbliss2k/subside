// INIT SCRIPT



global.game={}
with global.game {
	
	pause=0
	menu=0
	mode="walk"
	lang="ru"
}

scr_init_localizer()
scr_init_item()
scr_init_global_menus_setup()
scr_init_battles()
scr_init_console()

global.game.party=[
		
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
			
			stat_sp: 2,
			stat_atk: 2,
			
			eq_armor: "",
			eq_weapon: "",
		},
		
	]

global.options={}
with global.options {
	
	switch_1=0
	
	resolution=0
	resolutions=[
		/*0*/["2x",1708,960],
		/*1*/["1.5x",1281,720],
		/*2*/["1x",854,480],
		/*3*/["0.5x",427,240],
	]
	
	fullscreen=1
	
}

scr_getkey_setup()

scr_load_options()

// MSG SETUP

global.msg=[]

