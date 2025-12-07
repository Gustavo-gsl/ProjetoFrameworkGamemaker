estado = "idle";
criei_bala = false;
tempo_tiro = room_speed *5;
timer_tiro = tempo_tiro;

muda_sprite = function(_sprite){

	if(sprite_index != _sprite){

		sprite_index = _sprite;
		image_index = 0;
	}

}