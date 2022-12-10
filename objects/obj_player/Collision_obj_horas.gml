/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_clock,0,false)
horas_comp += 10;
if horas_comp > 60{
	horas_comp = 60;
}

instance_destroy(other);

