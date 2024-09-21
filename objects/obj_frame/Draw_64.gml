draw_set_font(fnt_frame)

#region Contador de bombas
	draw_set_color(#600000)
	draw_text(x + 63, y + 27, string(888))

	draw_set_color(#ff0000)

	if (_hundreds == 1) {
		draw_text(x + 33 + 7, y + 27, string(_hundreds))
	} else {
		draw_text(x + 42, y + 27, string(_hundreds))
	}
	if (_tens == 1) {
		draw_text(x + 63 + 7, y + 27, string(_tens))
	} else {
		draw_text(x + 63, y + 27, string(_tens))
	}
	if (_units == 1) {
		draw_text(x + 84 + 8, y + 27, string(_units))
	} else {
		draw_text(x + 84, y + 27, string(_units))
	}
#endregion

#region Timer
	draw_set_color(#600000)
	draw_text(room_width - 64, y + 27, string(888))

	draw_set_color(#ff0000)

	if (_timer_hundreds == 1) {
		draw_text(room_width - 85 + 7, y + 27, string(_timer_hundreds))
	} else {
		draw_text(room_width - 85, y + 27, string(_timer_hundreds))
	}
	if (_timer_tens == 1) {
		draw_text(room_width - 64 + 7, y + 27, string(_timer_tens))
	} else {
		draw_text(room_width - 64, y + 27, string(_timer_tens))
	}
	if (_timer_units == 1) {
		draw_text(room_width - 43 + 7, y + 27, string(_timer_units))
	} else {
		draw_text(room_width - 43, y + 27, string(_timer_units))
	}
#endregion

draw_set_color(c_white)
