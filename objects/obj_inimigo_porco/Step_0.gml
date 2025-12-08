//Pausando elemento
if (global.paused == true) {
	
	velh = 0;
	velv = 0;
	
    image_speed = 0;
    exit;
	
} else {
	
    image_speed = 1;
	
}

if (morto){
	
	sprite_index = spr_inimigo_porco_dead;
	
	//Sumindo se a animação acabou
	if (image_index == 3){
	
		image_alpha -= 0.1;
	
	}
	
	if (image_alpha <= 0){
		
		instance_destroy();
		
	}
	
	exit;	
	
}


//Verificando se o porco esta no chão
var _chao = place_meeting(x, y + 1, obj_chao)

if (estado == "normal")
{

	//Checando se eu colidi com uma bomba
	var _bomba = instance_place(x, y, obj_bomba);
	
	if (_bomba)
	{
		//Checando se ela tá apagada
		if(_bomba.momento == "off")
		{
			estado = "fosforo_on";
		}
	
	}
	
	var _canhao = instance_place(x,y, obj_canhao);
	
	if(_canhao){
		
		if(_canhao.estado == "idle"){
		
		estado = "fosforo_on";
		}
	}

	if (_chao)
	{	
		//Vou diminuir o tempo de decidir andar
		tempo_decidir_andar -= 1;
	
		//Se o tempo acabou eu decido se vou andar
		if (tempo_decidir_andar <= 0)
		{
			andando = choose (true, false);
		
		
			//Escolhendo a direção se decidir andar
			if (andando)
			{
				velh = choose(vel,-vel);
			}
			else
			{
				velh = 0;
			}
		
			//Resetando o tempo
			tempo_decidir_andar = room_speed * 3;
		}
	
		//Controlando a animação do inimigo
		if (velh != 0 && dano == false)
		{
			sprite_index = spr_inimigo_porco_run;
			image_xscale = sign(velh);
		}
		else
		{
			sprite_index = spr_inimigo_porco_idle;
		}
	
		//Se eu bater na parede eu viro
		if (place_meeting(x + velh, y, obj_chao))
		{
			velh *= -1;	
		}
	
		if (pode_cair == false){
	
			if (place_meeting(x + (velh * 13), y + 1, obj_chao) == false){
			
				velh *= -1;
			
			}
	
		}

	}
	else
	{	//Se eu não estou no chão eu aplico a gravidade
		velv += grav;
	
		//velh = 0;
	
		if (velh != 0)
		{
			image_xscale = sign(velh);
		}
	}
}

//Checar se estou tomando dano

else if (estado == "fosforo_on")
{
	//Mudando a sprite dele
	if (sprite_index != spr_porco_fosforo_on)
	{
		sprite_index = spr_porco_fosforo_on;
		image_index = 0;
	}
	velh = 0;
	
	//Depois que acendeu o fósforo ele muda de estado
	if (image_index >= image_number -1)
	{
		estado = "fosforo_bomba";	
	}
}
else if (estado == "fosforo_bomba")
{
	if (sprite_index != spr_porco_fosforo_bomba)
	{
		sprite_index = spr_porco_fosforo_bomba;
		image_index = 0;
	}
	
	//Terminou a animação
	if (image_index >= image_number -1)
	{
		var _bomba = instance_place(x, y, obj_bomba);
		if (_bomba)
		{
			_bomba.momento = "on";
		}
		estado = "normal";
		
		var _canhao = instance_place(x,y,obj_canhao);
		if(_canhao){
		_canhao.estado = "on";
		}
		estado = "normal";
	} 
}

if (dano && morto == false)
{
	sprite_index = spr_inimigo_porco_dano;
	velh = 0;
}