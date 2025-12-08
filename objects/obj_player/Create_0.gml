velh		= 0;
velv		= 0;
vel			= 4;
vel_jump	= 7;
grav		= .3;

estado = "normal";

posso_perder_vida = true;
dano		= false;
tempo_dano	= room_speed * 0.5;
timer_dano	= 0;

tempo_reinicia = room_speed * 2;
timer_reinicia = tempo_reinicia;

inv_tempo = room_speed * 4;
inv_timer = 0;

inputs = {
	
	left:	ord("A"),
	right:	ord("D"),
	jump:	vk_space,
	
}

/*if (estado == "dead")
{
    mudando_sprite(spr_player_dead);
        
    if (image_index > image_number -1)
    {
        image_speed = 0;
        image_index = image_number -1;
    }
    estado = "dead";
}