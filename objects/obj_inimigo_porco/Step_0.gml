//Verificando se o porco esta no chão
var _chao = place_meeting(x, y + 1, obj_chao)

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
	if (velh != 0)
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