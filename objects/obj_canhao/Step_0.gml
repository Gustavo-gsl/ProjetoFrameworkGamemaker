switch(estado){
	
case "idle":

muda_sprite(spr_canhao_idle);
criei_bala = false;


break;


case "on":

muda_sprite(spr_canhao_on);

	if(image_index >= 1.5 && criei_bala = false){
		
		var _bola = instance_create_layer(x +(5* image_xscale),y -11, "Projeteis", obj_bola);
		_bola.velh = (-7+ random_range (0,3)) * image_xscale;
		_bola.velv = -3;
		criei_bala = true;
	}
	
	if( image_index >= image_number -1){
	
		estado = "espera";	
			
	}
	
break;

case "espera":
	muda_sprite(spr_canhao_idle);
	timer_tiro --;
	
	if(timer_tiro <= 0){
	timer_tiro = tempo_tiro;
	estado = "idle";
	}

break;

}