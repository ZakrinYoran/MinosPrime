extends "res://MinosPrime/MinosState.gd"


func _frame_7():
	host.start_invulnerability()
	host.colliding_with_opponent = false


func _frame_9():
	var new_pos = host.opponent.get_pos()
	var new_x = new_pos.x - 20*(host.get_facing_int())
	host.set_pos(new_x, new_pos.y-5)
	host.set_vel(host.opponent.get_vel().x, host.opponent.get_vel().y)
	host.end_invulnerability()
	host.colliding_with_opponent = true
