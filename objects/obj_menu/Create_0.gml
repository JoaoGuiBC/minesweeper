global.game_on = false

var _view_w = 600
var _view_h = 600

#region Configuração da tela
	window_set_caption("Minesweeper")

	application_surface_enable(false)

	room_width = _view_w
	room_height = _view_h

	camera_set_view_size(view_camera[0], _view_w, _view_h)
	window_set_size(_view_w, _view_h)
	
	window_center()
	
	image_xscale = _view_w / sprite_width
	image_yscale = _view_h / sprite_height
#endregion

#region Cria os botões de escolha de deficuldade
	var _beginner_button = instance_create_depth(0, 200, -1, obj_menu_button)
	_beginner_button.x = room_width / 2 - _beginner_button.sprite_width / 2
	_beginner_button._game_difficulty = 0
	
	var _intermediate_button = instance_create_depth(0, 270, -1, obj_menu_button)
	_intermediate_button.x = room_width / 2 - _intermediate_button.sprite_width / 2
	_intermediate_button._game_difficulty = 1
	
	var _expert_button = instance_create_depth(0, 340, -1, obj_menu_button)
	_expert_button.x = room_width / 2 - _expert_button.sprite_width / 2
	_expert_button._game_difficulty = 2
#endregion
