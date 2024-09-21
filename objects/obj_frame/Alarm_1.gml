if (global.game_on) {
	_timer++

	_timer_hundreds = _timer div 100
	_timer_tens = (_timer div 10) mod 10
	_timer_units = _timer mod 10

	if (_timer != 999) {
		alarm[1] = 60
	}
}
