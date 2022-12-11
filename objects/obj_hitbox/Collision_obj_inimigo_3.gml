/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_grito_feminino,0,false);
other.vida -= obj_player.dano;

var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);

other.empurrar_dir = _dir;
other.empurrar_veloc = 6;
other.estado = scr_inimigo_hit;
other.alarm[1] = 5;
other.hit = true;

