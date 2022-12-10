// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_player_colisao(){
	x += hvelocidade;
	
	if(place_meeting(x + hvelocidade, y, obj_table)){
		while !place_meeting(x + sign(hvelocidade), y, obj_table){
			x += sign(hvelocidade)
		}
		hvelocidade = 0;
	}

	
	if(place_meeting(x, y + vvelocidade, obj_table)){
		while !place_meeting(x, y + sign(vvelocidade), obj_table){
			y += sign(vvelocidade);
		}
		vvelocidade = 0;
	}
	y += vvelocidade;
	
}
function scr_player_andando(){
	gamepad_set_axis_deadzone(global.controle, 0.25);
	direita = keyboard_check(ord("D")) or gamepad_axis_value(global.controle, gp_axislh) > 0.25;
	cima = keyboard_check(ord("W")) or gamepad_axis_value(global.controle, gp_axislv) < -0.25;
	esquerda = keyboard_check(ord("A")) or gamepad_axis_value(global.controle, gp_axislh) < -0.25;
	baixo = keyboard_check(ord("S")) or gamepad_axis_value(global.controle, gp_axislv) > 0.25;
	hvelocidade = (direita - esquerda) * velocidade;
	vvelocidade = (baixo - cima) * velocidade;
	
	scr_player_colisao();
	
		

	//// trocar sprites
	if gamepad_is_connected(global.controle){
		if gamepad_axis_value(global.controle, gp_axislh) != 0 or gamepad_axis_value(global.controle, gp_axislv){
			dir = floor((point_direction(x, y, x + gamepad_axis_value(global.controle, gp_axislh), y + gamepad_axis_value(global.controle, gp_axislv))+45)/90);
		}
	}else{
		dir = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);
	}
	
	if (hvelocidade == 0 and vvelocidade == 0){
		switch dir{
			default:
				sprite_index = spr_personagem_parado_direita_strip6;
				break;
			case 1:
				sprite_index = spr_personagem_parado_cima_strip6
				break;
			case 2:
				sprite_index = spr_personagem_parado_esquerda_strip6
				break;
			case 3:
				sprite_index = spr_personagem_parado_baixo_strip6
				break;
		}
	}else{
		switch dir{
			default:
				sprite_index = spr_personagem_correndo_direita_strip6;
				
				break;
			case 1:
				sprite_index = spr_personagem_correndo_cima_strip6
				
				break;
			case 2:
				sprite_index = spr_personagem_correndo_esquerda_strip6
				
				break;
			case 3:
				sprite_index = spr_personagem_correndo_baixo_strip6
				
				break;
		}
	}
	
	
	if estamina >= 10 {
		if mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(global.controle, gp_shoulderr){
			estamina -= 10;
			alarm[1] = 180;
			
			alarm[0] = 8;
			if gamepad_is_connected(global.controle){
				if gamepad_axis_value(global.controle, gp_axislh) != 0 or gamepad_axis_value(global.controle, gp_axislv){
					dash_dir = point_direction(x, y, x + gamepad_axis_value(global.controle, gp_axislh), y + gamepad_axis_value(global.controle, gp_axislv));
				}
			}else{
				dash_dir = point_direction(x, y, mouse_x, mouse_y);
			}
			estado = scr_dash;
		
		}
	}
	
	if mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(global.controle, gp_face2){
		image_index = 0;
		switch dir {
			default:
				sprite_index = spr_player_habilidade_1_direito_strip6;
				break;
			
			case 1:
				sprite_index = spr_personagem_correndo_cima_strip6;
				break;
			
			case 2:
				sprite_index = spr_player_habilidade_1_esquerdo_strip6;
				break;
			
			case 3:
				sprite_index = spr_player_habilidade_1_frente_strip6;
				break;
		}
		
		estado = scr_player_atacando;
	}
	
	
}

function scr_dash(){ 
	tomar_dano = false;
	hvelocidade = lengthdir_x(dash_veloc, dash_dir);
	vvelocidade = lengthdir_y(dash_veloc, dash_dir);
	
	x += hvelocidade;
	y += vvelocidade;
	
	var _inst = instance_create_layer(x, y, "instances", obj_dash);
	_inst.sprite_index = sprite_index;	
}

function scr_player_atacando(){
	
	if image_index >= 1{
		if atacar == false{
			switch dir{
				default:
					instance_create_layer(x + 10, y, "Instances", obj_hitbox);
					audio_play_sound(snd_punch,0,false)
					break;
			
				case 1:
					instance_create_layer(x, y - 10, "Instances", obj_hitbox);
					audio_play_sound(snd_punch,0,false)
					break;
			
				case 2:
					instance_create_layer(x - 10, y, "Instances", obj_hitbox);
					audio_play_sound(snd_punch,0,false)
					break;
			
				case 3:
					instance_create_layer(x, y + 10, "Instances", obj_hitbox);
					audio_play_sound(snd_punch,0,false)
					break;
			}
			atacar = true;
		}
	}
	
	if fim_da_animacao(){
		estado = scr_player_andando;
		atacar = false;
	}
}

function scr_player_hit(){
	if alarm[2] > 0{
		
		hvelocidade = lengthdir_x(3,empurrar_dir);
		vvelocidade = lengthdir_y(3, empurrar_dir);
	
		scr_player_colisao();
	}else{
		estado = scr_player_andando;
	}
	
}

function scr_player_habilidades(){
	if keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.controle, gp_face1) and global.habi_01_qtn > 0{
		audio_play_sound(snd_hab,0,false)
		switch dir{
			default:
				instance_create_layer( x+ 20, y-8, "instances", obj_habilidade_1);
				obj_habilidade_1.direction = 0;
				obj_habilidade_1.speed = 5;
				obj_habilidade_1.habi_01_dano = 4;
				global.habi_01_qtn-=1;
				break;
			case 1:
				instance_create_layer(x, y-16, "instances", obj_habilidade_1);
				obj_habilidade_1.direction = 90;
				obj_habilidade_1.image_angle = 90;
				obj_habilidade_1.speed = 5;
				obj_habilidade_1.habi_01_dano = 4;
				global.habi_01_qtn-=1;
				break;
			case 2:
				instance_create_layer(x-20, y-8, "instances", obj_habilidade_1);
				obj_habilidade_1.direction = 180;
				obj_habilidade_1.speed = 5;
				obj_habilidade_1.habi_01_dano = 4;
				global.habi_01_qtn-=1;
				break;
			case 3:
				instance_create_layer(x, y+16, "instances", obj_habilidade_1);
				obj_habilidade_1.direction = 270;
				obj_habilidade_1.image_angle = 270;
				obj_habilidade_1.speed = 5;
				obj_habilidade_1.habi_01_dano = 4;
				global.habi_01_qtn-=1;
				break;
		}
		
	}
}