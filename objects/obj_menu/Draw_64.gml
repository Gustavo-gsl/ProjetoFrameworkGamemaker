for (var i = 0; i < array_length(menu); i++){
	
	var _cor = c_white
	
	draw_set_font(fnt_menu)
	var _altura = string_height("I") * 1.5;
	var _largura_texto = string_width(menu[i].texto);
	
	var _x = 125;
	var _y = 320 + (_altura * 1.7 * i);
	
	var _margem = 0;
	
	if (i == atual){
	
		_margem = margem;
	
	}
	
	var spr = bg_button;
	var bw = sprite_get_width(spr);
	var bh = sprite_get_height(spr);
	
	var texto_x = _x + _margem + (bw - _largura_texto) / 2;
	var texto_y = _y + (bh - _altura / 1.5) / 2;
	
	draw_sprite(spr, 0, _x + _margem, _y);
	
	if (i == atual){
	
		if (atual == 0){
		
			draw_set_color(c_lime);
		
		}
		
		if (atual == 1){
		
			draw_set_color(c_gray);
		
		}
		
		if (atual == 2){
		
			draw_set_color(c_red);
		
		}
	
	} else{
	
		draw_set_color(c_black);
	
	}
	
	draw_text(texto_x, texto_y, menu[i].texto);

	draw_set_color(c_black);
	draw_set_font(-1);

}