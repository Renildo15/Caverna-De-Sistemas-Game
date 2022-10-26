/// @description Insert description here
// You can write your code in this editor
if hit == true{
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
}else{
	draw_self();
	if machucado == true{
		yy++;
		alpha -= 0.05;
		draw_set_alpha(alpha);
		draw_text(x,y - (sprite_height / 2) -yy, dano);
		draw_set_alpha(1);
		
		if yy > 20{
			machucado = false;
		}
	}else{
		yy = 0;
		alpha = 1;
	}
}


