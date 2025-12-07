// Inherit the parent event
event_inherited();

//Personalizando as variáveis
//Ele decide se vai para a direita ou para a esquerda

vel = choose(1, -1);
estado = "normal";

andando = choose(true, false);

if (andando)
{
	if (andando)
	{
		velh = choose(vel,-vel);
	}
	else
	{
		velh = 0;
	}	
}

tempo_decidir_andar = room_speed * 3;
