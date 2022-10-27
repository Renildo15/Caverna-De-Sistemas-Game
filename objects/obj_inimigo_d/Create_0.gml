/// @description Insert description here
// You can write your code in this editor
randomize();
//movimentação
estado = scr_inimigo_escolhe_estado;
prox_estado = 0;

hvelocidade = 0;
vvelocidade = 0;
velocidade = 0.2;
veloc_persegue = 0.5;

dest_x = 0;
dest_y = 0;

alarm[0] = 1;

dist_aggro = 100;
dist_desaggro = 10;

//combate
vida = 20;
empurrar_dir = 0;
empurrar_veloc = 0;
hit = false

machucado = false;
alpha = 1;
dano = 0;
yy = 0;