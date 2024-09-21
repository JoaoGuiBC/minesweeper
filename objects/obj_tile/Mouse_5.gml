if (global.game_on) {
	if (!_got_checked) {
		if (_is_flagged) {
			_is_flagged = false
		
			sprite_index = spr_tile_closed
			_game_controller._bombs_remaining++
			_frame.alarm[0] = 1
		} else {
			if (global.bomb_quantity == 0) { return }
		
			_is_flagged = true
		
			sprite_index = spr_flag_tile
			_game_controller._bombs_remaining--
			_frame.alarm[0] = 1
		}
	
		_frame.alarm[1] = 60
	}
}
