switch other.type {
	
	case "heal":
		break
		
	case "damage":
		if iv_cooldown<1 {
			global.game.party[self_party].stat_hp-=other.amount
			iv_cooldown=35
		}
		break
	
}

with other instance_destroy()