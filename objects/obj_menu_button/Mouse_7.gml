sprite_index = spr_menu_button

global.game_rows = _difficulty_options[_game_difficulty].n_of_rows
global.game_columns = _difficulty_options[_game_difficulty].n_of_columns
global.bomb_quantity = _difficulty_options[_game_difficulty].n_of_bombs

global.game_on = true

window_set_caption("Minesweeper - " + _difficulty_options[_game_difficulty].title)

room_goto(rm_game)