if (keyboard_check_pressed(vk_down)){

	atual++;
	margem = 0;

}

if (keyboard_check_pressed(vk_up)){

	atual--;
	margem = 0;

}

//Limitando intervalo da variável
atual = clamp(atual, 0, array_length(menu) - 1);

if (keyboard_check_pressed(vk_enter)){

	menu[atual].funcao();

}

margem = lerp(margem, 20, .2);