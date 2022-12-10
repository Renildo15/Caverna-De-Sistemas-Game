// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function src_inimigo_checar_player(){
	if distance_to_object(obj_player) <= dist_aggro{
		estado = scr_inimigo_perseguindo;
	}
}


function scr_inimigo_escolhe_estado(){
	src_inimigo_checar_player();
	prox_estado = choose(scr_inimigo_andando, scr_inimigo_parado);
	if prox_estado == scr_inimigo_andando{
		estado =scr_inimigo_andando;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	}else if prox_estado == scr_inimigo_parado{
		estado = scr_inimigo_parado;
	}
}

function scr_inimigo_andando(){
	src_inimigo_checar_player();
	image_speed = 1.5;
	if distance_to_point(dest_x, dest_y) > velocidade{
		var _dir = point_direction(x,y, dest_x, dest_y);
		hvelocidade = lengthdir_x(velocidade, _dir);
		vvelocidade = lengthdir_y(velocidade, _dir);
		
		x += hvelocidade;
		y += vvelocidade;
	}else{
		x = dest_x;
		y = dest_y;
	}
	
}

function scr_inimigo_parado(){
	src_inimigo_checar_player();
	image_speed = 0.5;
}

function scr_inimigo_perseguindo(){
	image_speed = 1.5;
	dest_x = obj_player.x;
	dest_y = obj_player.y;
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hvelocidade = lengthdir_x(veloc_persegue, _dir);
	vvelocidade = lengthdir_y(veloc_persegue, _dir);
	
	x += hvelocidade;
	y += vvelocidade;
	
	if distance_to_object(obj_player) >= dist_desaggro{
		estado = scr_inimigo_escolhe_estado;
		alarm[0] = irandom_range(120, 240);
	}
}

function scr_inimigo_hit(){

	empurrar_veloc = lerp(empurrar_veloc, 0, 0.05);
	hvelocidade = lengthdir_x(empurrar_veloc, empurrar_dir);
	vvelocidade = lengthdir_y(empurrar_veloc, empurrar_dir);
	
	x += hvelocidade;
	y += vvelocidade;
}