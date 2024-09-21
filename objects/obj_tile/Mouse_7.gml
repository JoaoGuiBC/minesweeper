if (global.game_on) {
	if (_got_checked && !_is_flagged) {
		var _len = array_length(_neighboring_tiles)
	
		for (var _i = 0; _i < _len; _i++) {
			if (_neighboring_tiles[_i]._got_checked || _neighboring_tiles[_i]._is_flagged) continue
		
			_neighboring_tiles[_i].sprite_index = spr_tile_closed
		}
		
		check_tile_surroundings()
	}

	if (!_got_checked && !_is_flagged) {
		if (holds_bomb) {
			sprite_index = spr_red_mine_tile
		
			_got_checked = true
		
			if (_game_controller != noone) _game_controller.detonate(id)

			return
		}
	
	
		check_tile()
	}
}
