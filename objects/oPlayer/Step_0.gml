//Get player input
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(ord("E"));
keyAttack = keyboard_check_pressed(vk_space);
keyItem = keyboard_check_pressed(ord("F"));

inputDirection = point_direction(0,0,keyRight-keyLeft, keyDown-keyUp);//угол передвижения (так как растояние равно 0) = вектор(мы по x, мы по y, то куда мы нажимаем, то куда мы нажимаем) 
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);//не даёт идти влево и в право одновременно и вверх и вниз

//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);//(направление и скорость) = (идём мы или нет * скорость, куда мы идём)
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

x += hSpeed;
y += vSpeed;

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
