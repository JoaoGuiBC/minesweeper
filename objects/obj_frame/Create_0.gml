_game_controller = instance_find(obj_game_controlller, 0)

var _view_w = _game_controller._view_w
var _view_h = _game_controller._view_h

image_xscale = _view_w / sprite_width
image_yscale = _view_h / sprite_height

var _reset_button = instance_create_depth(_view_w / 2, 47, 0, obj_reset_button)
var _return_button = instance_create_depth(24, _view_h - 18, 0, obj_return_button)

_hundreds = _game_controller._bombs_remaining div 100
_tens = (_game_controller._bombs_remaining div 10) mod 10
_units = _game_controller._bombs_remaining mod 10

_timer = 0

_timer_hundreds = _timer div 100
_timer_tens = (_timer div 10) mod 10
_timer_units = _timer mod 10
