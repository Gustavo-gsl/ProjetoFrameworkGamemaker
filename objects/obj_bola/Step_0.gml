velv += grav;



if(place_meeting(x,y+1, obj_chao)){
	if(velh !=0){
	velh *= .92;
	}
} else{
velh *= .995;	
	}

if(abs(velh) <= 0.1){
	instance_create_layer (x,y+ sprite_height/2, layer, obj_bomba);
	instance_destroy();
}

var _player = instance_place(x, y, obj_player);
	if (_player){
	
		with (_player){
		
			dano = true;
		
			// valor timer dano
			timer_dano = tempo_dano;
			inv_timer = inv_tempo;
		
		}
	
	}
	
	var _bomba = instance_place(x, y, obj_bomba);
		if (_bomba)
		{
			if(_bomba.momento == "off"){
			_bomba.momento = "on";
			}
		}