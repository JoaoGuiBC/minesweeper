_view_w = global.game_columns * 24 + 48
_view_h = global.game_rows * 24 + 130
_bombs_remaining = global.bomb_quantity
_tiles_remaining = (global.game_rows * global.game_columns) - global.bomb_quantity

#region Configuração da tela
	application_surface_enable(false)

	room_width = _view_w
	room_height = _view_h

	camera_set_view_size(view_camera[0], _view_w, _view_h)
	window_set_size(_view_w, _view_h)
	window_center()
	
	_frame = instance_create_depth(0, 0, 1, obj_frame)
#endregion

#region Criar as celulas
	randomize()
	_bomb_tiles = []
	_clean_tiles = []
	var _quantity_of_clean_bombs = (global.game_rows * global.game_columns) - global.bomb_quantity

	// Cria as celulas contendo bomba
	for (var _i = 0; _i < global.bomb_quantity; _i += 1) {
		var _tile = instance_create_depth(x, y, 1, obj_tile)

		_tile.holds_bomb = true
		//_tile.sprite_index = spr_mine_tile
	
		array_push(_bomb_tiles, _tile)
	}

	// Cria as celulas que não contem bomba
	for (var _i = 0; _i < _quantity_of_clean_bombs; _i += 1) {
		var _tile = instance_create_depth(x, y, 1, obj_tile)
	
		array_push(_clean_tiles, _tile)
	}

	// Une os dois arrays de celulas em um só
	var _all_tiles = array_concat(_bomb_tiles, _clean_tiles)

	// Embaralha a posição das celulas
	array_shuffle_ext(_all_tiles)

	// Posiciona as celulas no tela
	var _array_selector = 0
	for (var _i_y = 0; _i_y < global.game_rows; _i_y++) {
		for (var _i_x = 0; _i_x < global.game_columns; _i_x++) {
			_all_tiles[_array_selector].x = _i_x * 24 + 24
			_all_tiles[_array_selector].y = _i_y * 24 + 94
		
			_array_selector++
		}
	}

	var _len = array_length(_all_tiles);

	for (var _i = 0; _i < _len; _i++) {
		_all_tiles[_i].get_tile_info()
	}
#endregion

function detonate(_bomb) {
	for (var _i = 0; _i < global.bomb_quantity; _i += 1) {
		if (_bomb_tiles[_i].id == _bomb || _bomb_tiles[_i]._is_flagged) continue
		
		_bomb_tiles[_i].sprite_index = spr_mine_tile
	}
	
	for (var _i = 0; _i < array_length(_clean_tiles); _i += 1) {
		if (_clean_tiles[_i]._is_flagged) {
			_clean_tiles[_i].sprite_index = spr_wrong_flag_tile
		}
	}
	
	global.game_on = false
	
	var _reset_button = instance_find(obj_reset_button, 0)
	
	_reset_button.sprite_index = spr_reset_button_lost
}

function win() {
	for (var _i = 0; _i < global.bomb_quantity; _i += 1) {
		_bomb_tiles[_i].sprite_index = spr_flag_tile
	}
	
	_bombs_remaining = 0
	_frame.alarm[0] = 1

	global.game_on = false
	
	var _reset_button = instance_find(obj_reset_button, 0)
	
	_reset_button.sprite_index = spr_reset_button_win
}
