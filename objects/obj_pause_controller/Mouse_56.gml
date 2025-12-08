if (global.paused) {

    var sprW = sprite_get_width(bg_button);
    var sprH = sprite_get_height(bg_button);

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    //Botão continuar
    if (mx > btn_x[0] && mx < btn_x[0] + sprW &&
        my > btn_y[0] && my < btn_y[0] + sprH)
    {
        global.paused = false;
        exit;
    }

    //Botão reiniciar
    if (mx > btn_x[1] && mx < btn_x[1] + sprW &&
        my > btn_y[1] && my < btn_y[1] + sprH)
    {
        global.paused = false;
		global.vida = 3;
        room_restart();
        exit;
    }

    //Botão sair
    if (mx > btn_x[2] && mx < btn_x[2] + sprW &&
        my > btn_y[2] && my < btn_y[2] + sprH)
    {
        global.paused = false;
        room_goto(Room_Menu);
        exit;
    }
}