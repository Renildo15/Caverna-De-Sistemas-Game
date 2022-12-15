/// @description Insert description here
// You can write your code in this editor

pausar = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0, gp_start)

if pausar {
	if(room != rm_pause){
		if(instance_exists(obj_player)){
			
			obj_player.persistent = false;
			isPause = true;
			instance_activate_all();
		}
		audio_pause_sound(snd_battle_random)
		room_previous(room)
		room_goto(rm_pause)
	}else{
		room_goto_previous();
		instance_deactivate_all(true);
	}
}

