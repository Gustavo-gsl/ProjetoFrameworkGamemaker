switch(estado){
	
case "idle":

muda_sprite(spr_canhao_idle);


break;


case "on":

muda_sprite(spr_canhao_on);
	
	if( image_index >= image_number -1){
	
		estado = "espera";	
		
		var _bola = instance_create_layer(x,y, layer, obj_bola);
		_bola.velh = -4;
		
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