image_xscale = 0.255
image_yscale = 0.255

_game_controller = instance_find(obj_game_controlller, 0)
_frame = instance_find(obj_frame, 0)

_got_checked = false
_is_flagged = false

_saved_sprite = sprite_index

_neighboring_tiles = []
_neighboring_bombs_counter = 0

_font_colors = [
	{value: #0000f7},
	{value: #007700},
	{value: #ec0000},
	{value: #000080},
	{value: #800000},
	{value: #008080},
	{value: #000000},
	{value: #707070}
]

function get_tile_info() {
	for (var _i = 0; _i < 9; _i ++) {
		if (holds_bomb) return
	
		var _pos_y = y + 24
		var _pos_x = x

		if (_i < 6) {
			_pos_y = y
		}
		if (_i < 3) {
			_pos_y = y - 24
		}
	
		if (_i == 0 || _i == 3 || _i == 6) {
			_pos_x = x - 24
		}
		if (_i == 2 || _i == 5 || _i == 8) {
			_pos_x = x + 24
		}
	
	
		var _neighboring_tile = instance_position(_pos_x, _pos_y, obj_tile);
	
		if (_neighboring_tile == noone) continue
		if (_neighboring_tile.id == id) continue
	
		array_push(_neighboring_tiles, _neighboring_tile)

		if (_neighboring_tile.holds_bomb) _neighboring_bombs_counter++
	}
}

function check_tile() {
	_got_checked = true
	sprite_index = spr_tile_clear
	
	_frame.alarm[1] = 60
	
	_game_controller._tiles_remaining--
	
	if (_game_controller._tiles_remaining == 0) _game_controller.win()
	
	if (_neighboring_bombs_counter > 0) return
	
	for (var _i = 0; _i < array_length(_neighboring_tiles); _i++) {
		if (!_neighboring_tiles[_i]._got_checked) {
			_neighboring_tiles[_i].check_tile()
		}
	}
}

function check_tile_surroundings() {
	var _flag_counter = 0
	var _flaggled_bombs_counter = 0
	
	for (var _i = 0; _i < array_length(_neighboring_tiles); _i++) {
		if (_neighboring_tiles[_i]._is_flagged) {
			_flag_counter++
			
			if (_neighboring_tiles[_i].holds_bomb) {
				_flaggled_bombs_counter++
			}
		}
	}
	
	if (_flag_counter == _neighboring_bombs_counter) {
		if (_flaggled_bombs_counter == _neighboring_bombs_counter) {
			for (var _i = 0; _i < array_length(_neighboring_tiles); _i++) {
				if (!_neighboring_tiles[_i]._got_checked && !_neighboring_tiles[_i]._is_flagged) {
					_neighboring_tiles[_i].check_tile()
				}
			}
			
			return
		}

		for (var _i = 0; _i < array_length(_neighboring_tiles); _i++) {
			if (_neighboring_tiles[_i].holds_bomb) {
				_neighboring_tiles[_i].sprite_index = spr_red_mine_tile

				_game_controller.detonate(_neighboring_tiles[_i].id)
			}
		}
	}
}
