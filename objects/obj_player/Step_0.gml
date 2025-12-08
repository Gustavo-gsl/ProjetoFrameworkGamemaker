//Verificando colisão com o chão
var _chao = place_meeting(x, y + 1, obj_chao)

//Move
var _left, _right, _jump;

_left	= keyboard_check(inputs.left);
_right	= keyboard_check(inputs.right);
_jump	= keyboard_check(inputs.jump);

// só pode se mexer se o timer do dano estiver zerado
if(timer_dano <= 0){
	
velh	= (_right - _left) * vel;

}
//Pulo
if (_chao){

	if (_jump){

		velv -= vel_jump;

	}
	
	if (velh != 0){
	
		sprite_index = spr_player_run;
		image_xscale = sign(velh);	
	
	} else{
	
		sprite_index = spr_player_idle;
	
	}

} else{
	
	
	if (velv < 0){
	
		sprite_index = spr_player_jump;
	
	} else{
	
		sprite_index = spr_player_fall;
		
		//Se estou indo para baixo, posso cair na cabeça do inimigo
		var _inimigo = instance_place(x, y + 1, obj_inimigo_pai);
		
		// Se eu cair no inimigo
		if (_inimigo){
			
			dano = false;	
			
			//Se o inimigo não morreu
			if(_inimigo.dano == false){
		
				// subir no ar
				velv = -vel_jump;
			
				//Avisando que o inimigo sofreu dano
				_inimigo.dano = true;
		
			}
		}	
	}

	//Aplicando gravidade
	velv += grav;
	
	if (velh != 0){
	
		image_xscale = sign(velh);
		
	}
	
}

// Morte
if (estado == "dead")
{
    sprite_index = spr_player_dead;
	
	timer_reinicia--;
	if (timer_reinicia <= 0)
	{
		game_restart();	
	}
	
    image_speed = 0.2;

    // trava no último frame depois que termina a animação
    if (image_index >= image_number - 1)
        image_speed = 0;

    exit; // impede o resto do step de mudar o sprite
}

if (dano){
	
	sprite_index = spr_player_hit;
	velh = 0;
	if(posso_perder_vida)
	{
		global.vida--;
		
		if (global.vida <= 0)
		{
			estado = "dead";	
		}
		else
		{
			posso_perder_vida = false;
		}
	}
	
}

//Diminuir o timer de dano se for maior que zero
if (timer_dano > 0){

	timer_dano--;

} else{

	//Fim do timer de dano
	dano = false;
	posso_perder_vida = true;
}

if (inv_timer > 0){

	inv_timer--;
	
	image_alpha = .5;

} else{

	image_alpha = 1;

}

// Tomando dano

var _inimigo = instance_place( x, y, obj_inimigo_pai);

if (_inimigo && inv_timer <= 0){
		
	if(_inimigo.morto == false && _inimigo.dano == false){
		
		dano = true;
		// valor timer dano
		timer_dano = tempo_dano;
		inv_timer = inv_tempo;
		
	}	
}