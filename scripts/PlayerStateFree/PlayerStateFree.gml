function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);//(направление и скорость) = (идём мы или нет * скорость, куда мы идём)
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)//если мы нажимаем кнопку то запускаем анимацию в нужном направлении
	{
		direction = inputDirection;//если бы мы вложили бы в переменную 369 то он бы перевёт бы её в 8
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;//нужно чтобы если бы у нас было несколько спрайтов в состоянии idle при переходе поигрывать анимацию не с середины а с нуля

	//Update Image Index
	PlayerAnimationSprite();

	//Activate key logic
	if (keyActivate)
	{
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x+_activateX, y+_activateY, pEntity);
		
		if (activate == noone || activate.entityActivateScript == -1)
		{
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;
		}
		else
		{
			//Activate the entity
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			//Make an npc face the player
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
}