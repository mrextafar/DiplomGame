function PlayerStateRoll(){
	//Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);//ограничиваем переменную чтобы она не могла быть меньше 0
	var _collided = PlayerCollision();//нужно чтобы мы отскакивали от стены если мы в неё врежемся
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1);//(moveDistanceRemaining / distanceRoll) говорит нам насколько далеко мы уже перекатились 1 - (moveDistanceRemaining / distanceRoll) даёт нам его обратную величину 
	
	//Change State
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;	
	}
}