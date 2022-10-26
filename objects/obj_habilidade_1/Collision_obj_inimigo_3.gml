/// @description Insert description here
// You can write your code in this editor
other.vida -= habi_01_dano;
other.machucado = true;
other.dano = habi_01_dano;
instance_destroy();

var _dir = point_direction(x,y, other.x, other.y);

other.empurrar_dir = _dir;
other.empurrar_veloc = 6;
other.estado = scr_inimigo_hit;

other.alarm[1] = 5;
other.hit = true;

