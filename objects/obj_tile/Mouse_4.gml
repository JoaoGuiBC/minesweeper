if (global.game_on) {
	if (!_got_checked && !_is_flagged) {
		sprite_index = spr_tile_clear
	}

	if (_got_checked && !_is_flagged) {
		var _len = array_length(_neighboring_tiles)
	
		for (var _i = _len - 1; _i >= 0; _i--) {
			if (!_neighboring_tiles[_i]._is_flagged) {
				_neighboring_tiles[_i].sprite_index = spr_tile_clear
			}
		}
	}
}
