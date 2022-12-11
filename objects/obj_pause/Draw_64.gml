/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var op_max = array_length(opcoes);

for(var i = 0; i < op_max; i++){
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	
	var _hstr = string_height("I");
	var _wstr = string_width(opcoes[i]);
	var _dist = 80;
	var x1 = _wgui/2 - _wstr /2;
	var y1 = _hgui/2 - _dist/2 + _dist * i;
	
	var x2 = _wgui/2 + _wstr /2;
	var y2 = _hgui/2 + _dist/2 + _dist * i;
	
	if(point_in_rectangle(_mx, _my,x1,y1,x2,y2)){
		esc = 3
		
		if(mouse_check_button_pressed(mb_left)){
			switch opcoes[i]{
				case opcoes[0]://retornar
					room_goto(Room1);
					audio_resume_sound(snd_battle_random)
					break;
				
				case opcoes[1]://menu
					game_restart();
					break;
				
				case opcoes[2]://opções
					break;
				
				case opcoes[3]://sair
					game_end();
					break;
			}
		}
	}else{
		esc = 2;
	}
	
	
	draw_text_transformed(_wgui/2, _hgui/2 + _dist * i, opcoes[i], esc, esc, 0);
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);



