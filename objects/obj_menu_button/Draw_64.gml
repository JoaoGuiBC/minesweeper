draw_set_font(fnt_menu_button)
draw_set_color(_difficulty_options[_game_difficulty].color)

draw_set_halign(fa_center);
draw_text(x + sprite_width / 2, y + 10, _difficulty_options[_game_difficulty].title)

draw_set_color(#606060)
draw_text(
	x + sprite_width / 2,
	y + 28,
	string(_difficulty_options[_game_difficulty].n_of_columns) + "X" + string(_difficulty_options[_game_difficulty].n_of_rows)
)
