// Inherit the parent event
event_inherited();

if player_encounter() {
	
	battle_encounter(global.battle.group.knifeman)
	
}

draw_set_alpha(1)
draw_set_color(c_white)
draw_self()