function PlayerAnimationSprite(){
//Update Sprite
	var _cardinalDirection = round(direction/90);//вместо 0 - 360 градусов будет 0 - 3
	var _totalFrames = sprite_get_number(sprite_index) / 4;//так как у нас в одной анимации 4 направления спрайтов то мы просто выделяем сколько в одном направлении спрайтов
	image_index = localFrame + (_cardinalDirection * _totalFrames);//так как в анимации бега у нас 4 кадра в одну сторону то считать мы будем не 1234 а 0123 а так как вся анимация включает в себя 16 кадров то мы узнаём какой конкретно кадр в каком направлении под определённым индексом например (2й кадр влево будет 10ым мы его определяем как 1)
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;//просто распределяем кадры по скорости fps

//если анимация будет зацикливаться на следующем шаге игры
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;//нужно если анимация не зацикливается
		localFrame -= _totalFrames;
	} else animationEnd = false;
}