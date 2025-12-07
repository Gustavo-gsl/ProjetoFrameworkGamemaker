jogar = {

	texto: "Jogar",
	
	funcao : function(){
	
		room_goto(Room1);
	
	},

}

opcoes = {

	texto: "Opções",
	
	funcao : function(){
	
		show_message("Opções");
	
	},

}

sair = {

	texto: "Sair",
	
	funcao : function(){
	
		game_end();
	
	},

}

//Menu
menu = [jogar, opcoes, sair];

atual = 0;

margem = 0;