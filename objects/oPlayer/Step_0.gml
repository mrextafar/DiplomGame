//Get player input
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0,0,keyRight-keyLeft, keyDown-keyUp);//угол передвижения (так как растояние равно 0) = вектор(мы по x, мы по y, то куда мы нажимаем, то куда мы нажимаем) 
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);//не даёт идти влево и в право одновременно и вверх и вниз


if (!global.gamePaused) script_execute(state);//? part4,5