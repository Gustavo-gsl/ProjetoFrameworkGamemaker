//Método de desenhar coração
desenha_coracao = function(_x, _y)
{
	draw_sprite_ext (spr_coracao, 5 * (get_timer()/1000000), _x, _y, 2, 2, 0, c_white, 1);	
}