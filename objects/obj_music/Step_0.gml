/// @description Insert description here
// You can write your code in this editor

volume_maior = keyboard_check(vk_up);
volume_menor = keyboard_check(vk_down);

if (volume_maior){
	global.volume += 1;
	global.volume = clamp(global.volume,0,10);
}else if(volume_menor){
	global.volume -= 1;
	global.volume = clamp(global.volume,0,10);
}



if(global.currentVolume != global.volume){
	global.currentVolume = global.volume;
	var num = audio_get_listener_count()
	
	for(var i = 0; i < num; ++i){
		var info = audio_get_listener_info(i);
		var ind = info[? "index"];
		audio_set_master_gain(info[? "index"], global.currentVolume/10);
		ds_map_destroy(info)
	}
	
show_debug_message("Volume:" + string(audio_get_master_gain(ind)))
}