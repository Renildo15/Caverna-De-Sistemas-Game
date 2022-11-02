/// @description Insert description here
// You can write your code in this editor
var numSlot = gamepad_get_device_count();

for(var i = 0; i < numSlot; i++){
	if(gamepad_is_connected(i)){
		global.controle = i;
	}
}


