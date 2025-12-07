//Verificando colisão com o chão
var _chao = place_meeting(x, y + 1, obj_chao)

//Move
var _left, _right, _jump;

_left	= keyboard_check(inputs.left);
_right	= keyboard_check(inputs.right);
_jump	= keyboard_check(inputs.jump);

// so´pode se mexer se o timer do dano estiver zerado
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
			if(_inimigo.morto == false){
		
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


if ( dano){
	sprite_index = spr_player_hit;
	timer_dano --;
}

// Tomando dano

var _inimigo = instance_place( x,y, obj_inimigo_pai);

if (_inimigo){
	
	// valor timer dano
	timer_dano = tempo_dano;
	if(_inimigo.morto == false && _inimigo.dano == false){
		
		dano = true;
	}	
}