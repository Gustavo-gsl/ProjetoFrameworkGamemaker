//Se sprite de dano está ativa e a animação acabou, eu morro
if (sprite_index == spr_inimigo_porco_dano){

	//Mudando para morto
	morto = true;
	
}

if (sprite_index == spr_inimigo_porco_dead){

	image_speed = 0;
	image_index = 3;

}