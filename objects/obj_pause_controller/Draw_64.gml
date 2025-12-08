if (global.paused) {

    // Escurecer o fundo
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    // Aparecer o painel
    var spr = bg_painel;
    var pw = sprite_get_width(spr);
    var ph = sprite_get_height(spr);

    px = (display_get_gui_width() - pw) / 2;
    py = (display_get_gui_height() - ph) / 2;

    draw_sprite(spr, 0, px, py);

    // Fazendo os botões
	var sprW = sprite_get_width(bg_button);
	var sprH = sprite_get_height(bg_button);

	// Quantidade de botões
	var qtd = 3;

	//Definindo espaçamento base
	var esp = 80;
	
	// Altura total ocupada pelos botões
	var totalH = sprH * qtd + esp * (qtd - 1);

	// Início Y centralizado
	var by_start = py + (ph - totalH) / 2;

	// Início X centralizado
	var bx = px + (pw - sprW) / 2;

	// Desenha cada botão
	for (var i = 0; i < qtd; i++) {
		
		var by = by_start + i * (sprH + esp) / 1.5 + 50;
		
		draw_sprite(bg_button, 0, bx, by);

		btn_x[i] = bx;
	    btn_y[i] = by;

		draw_set_font(fnt_menu);

	    switch (i) {
	        case 0: draw_text(bx + 45, by + 15, "Continuar"); break;
	        case 1: draw_text(bx + 50, by + 15, "Reiniciar"); break;
	        case 2: draw_text(bx + 80, by + 15, "Sair"); break;
	    }
		
		draw_set_font(-1);
	}
	
}