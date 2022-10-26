/// @description Insert description here
// You can write your code in this editor



if horas_comp < 10{
	show_message("Vc precisa das horas complementares")
}else{
	if room_next(room) != -1{
		room_goto_next()
		audio_stop_sound(snd_battle_random);
	}else{
		room_goto(Room1);
	}
}
