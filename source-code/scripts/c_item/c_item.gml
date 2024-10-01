function c_item(){
	
	global.game.item={
		patch:2
	}
	
	// Returns description of an object
	
	// target can be "friend", "enemy", "any", "party" (all friends), "group" (all enemies) or "all"
	global.c.item={}
	with global.c.item {
		
		patch = {
			
			name = function() {return fl("")}
			
		}
		
	}
	
}