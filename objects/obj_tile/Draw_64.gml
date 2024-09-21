draw_set_font(fnt_tile)

if (_got_checked && _neighboring_bombs_counter > 0) {
	draw_set_color(_font_colors[_neighboring_bombs_counter - 1].value)
	draw_text(x + 13, y + 3, string(_neighboring_bombs_counter));

	draw_set_color(c_white);	
}
