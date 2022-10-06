function PlayerCollision(){
	var _collision = false;
	
	//Horisontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;//mod возвращает оставшуюся часть файла допустим у нас спрайт 18 то получается что 2 лишние их мы и возвращаем
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;//не даёт войти в тайл
		hSpeed = 0;
		_collision = true;
	}
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;//mod возвращает оставшуюся часть файла допустим у нас спрайт 18 то получается что 2 лишние их мы и возвращаем
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;//не даёт войти в тайл
		vSpeed = 0;
		_collision = true;
	}
	
	//Vertical Move Commit
	y += vSpeed;
	
	
	
	
	
	
	return _collision;
}