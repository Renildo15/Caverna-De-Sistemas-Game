/// @description Insert description here
// You can write your code in this editor
var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = obj_player.life;
var _maxvida = obj_player.max_vida;
var _estamina = obj_player.estamina;
var _maxestamina = obj_player.max_estamina;

//HUD
draw_sprite_ext(spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);
//Barra da vida
draw_sprite_ext(spr_hud_barra_vida, 0, 0,_huda,(_vida/_maxvida) * _escala, _escala, 0, c_white, 1);
//Barra de estamina
draw_sprite_ext(spr_hud_estamina, 0, 0, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white,1);

