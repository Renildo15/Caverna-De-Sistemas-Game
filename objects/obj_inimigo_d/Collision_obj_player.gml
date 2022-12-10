/// @description Insert description here
// You can write your code in this editor
if other.tomar_dano == true {
	audio_play_sound(snd_scream,0,false)
	var _dir = point_direction(x, y, other.x, other.y);
	with(other){
		empurrar_dir = _dir;
		estado = scr_player_hit;
		alarm[2] = 10;
		alarm[3] = 180;
		tomar_dano = false;
		life -= 12;
	}
}


