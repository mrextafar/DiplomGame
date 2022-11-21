/// @arg Response 
function Script10(){
	switch(argument0)
	{
		case 0: break;
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave responseB! Any further response?", 1, ["3:Yes!", "0:No."]); break;
		case 3: NewTextBox("Thanks for your responses!", 0); break;
		default: break;
	}
}