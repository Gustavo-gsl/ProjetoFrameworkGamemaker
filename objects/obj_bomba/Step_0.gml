velv += grav;

if (momento == "off"){

	sprite_index = spr_bomba;

} else if (momento == "on"){

	sprite_index = spr_bomba_on;
	
	//Rodando boom timer
	if (boom_timer > 0){
	
		boom_timer--;
	
	} else{
	
		//Se boom timer for 0 ou menos
		momento = "boom";
	
	}

} else if (momento == "boom"){
	
	//Checar de já mudou de sprite
	if (sprite_index != spr_bomba_boom){
	
		//Ou seja: acabou de chegar a esse momento
		//Mudo sprite
		sprite_index = spr_bomba_boom;
		
		//Começo animação do 0
		image_index = 0;
	
	}
	
	if (image_index >= image_number - 1){
	
		instance_destroy();
	
	}
	
	//Checando se a explosão colidiu com o player
	var _player = instance_place(x, y, obj_player);
	if (_player){
	
		with (_player){
		
			dano = true;
		
			// valor timer dano
			timer_dano = tempo_dano;
			inv_timer = inv_tempo;
		
		}
	
	}
	
	var _bomba = instance_place(x,y, obj_bomba);
	if(_bomba){
		if(_bomba.momento == "off"){
		_bomba.boom_timer = room_speed;
		_bomba.momento = "on";	
	
		}
	}
	

}