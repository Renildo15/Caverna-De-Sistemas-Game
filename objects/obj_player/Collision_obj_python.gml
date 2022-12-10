/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_python,0,false);
global.habi_01_qtn+= 5;
if global.habi_01_qtn > 15{
	global.habi_01_qtn = 15;
}

instance_destroy(other);

