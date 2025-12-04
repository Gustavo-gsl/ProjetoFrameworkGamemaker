//Colisão horizontal
//Checando colisão com a parede
var _col	= instance_place(x + velh, y, obj_chao);
if (_col){
	
	//Se vou para a direita, grudo à esquerda
	if(velh>0){
		
		x = _col.bbox_left + (x - bbox_right);
		
	}
	
	//Se vou para a esquerda, grudo à direita
	if(velh<0){
	
		x = _col.bbox_right + (x - bbox_left);
	
	}
	
	//Como colidi, parei
	velh = 0;

}

x += velh;

//Colisão vertical
//Checanco colisão com o chão ou teto
_col	= instance_place(x, y + velv, obj_chao);
if (_col){
	
	//Se estou caindo, grudo acima
	if (velv > 0){
		
		y = _col.bbox_top + (y - bbox_bottom);
		
	}
	
	//Se estou pulando, grudo abaixo
	if (velv < 0){
		
		y = _col.bbox_bottom + (y - bbox_top);
		
	}
	
	//Como colidi, parei
	velv = 0;
	
}

y += velv;