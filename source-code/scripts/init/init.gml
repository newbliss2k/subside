// INIT SCRIPT



global.game={}
with global.game {
	
	pause=0
	menu=0
	mode="walk"
	lang="ru"
}

scr_init_localizer()
scr_init_global_menus_setup()
scr_init_battles()

with global.game {
	party=[
		
		{
			name: "carol",
			display_name: function(){return localize("party_name_carol")},
			stat_lv: 1,
			stat_hp: 15,
			stat_hp_max: 20,
			stat_mn: 10,
			stat_mn_max: 10,
		},
		
	]
}

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
	
}

// MSG SETUP

global.msg=[]

scr_getkey_setup()

scr_file_load_options()

