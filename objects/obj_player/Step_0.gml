/// @description Insert description here
// You can write your code in this editor
/// movimentação

script_execute(estado);
script_execute(habi_01);


if alarm[1] <= 0 {
	estamina += 1;
}

estamina = clamp(estamina, 0, max_estamina);
if(instance_exists(obj_player)){
	if life <= 0{
		room_persistent = false;
		room_restart();
		audio_play_sound(snd_morte,0,false);
		instance_destroy();
		audio_stop_sound(snd_battle_random);
	}
}

