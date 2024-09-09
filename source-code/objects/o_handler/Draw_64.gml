var _a = game_end_timer/game_end_timer_max
draw_set_alpha(_a*0.5)

draw_set_font(font_small)
if _a>=0.75 _a="..."
else if _a>=0.5 _a=".."
else if _a>=0.25 _a="."
else _a=""

draw_set_color(c_white)

draw_text_outline(0,0,localize("game_exit_message")+_a,0.5)
draw_text(0,0,localize("game_exit_message")+_a)

draw_set_alpha(menu_alpha_bg)