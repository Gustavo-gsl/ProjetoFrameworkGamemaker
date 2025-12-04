//Verificando colisão com o chão
var _chao = place_meeting(x, y + 1, obj_chao)

//Move
var _left, _right, _jump;

_left	= keyboard_check(inputs.left);
_right	= keyboard_check(inputs.right);
_jump	= keyboard_check(inputs.jump);

velh	= (_right - _left) * vel;

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
	
	}

	//Aplicando gravidade
	velv += grav;
	
	if (velh != 0){
	
		image_xscale = sign(velh);
		
	}
	
}