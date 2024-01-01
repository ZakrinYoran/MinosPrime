extends CharacterState

#func _on_hit_something(obj, hitbox):
#	iasa_at = 19

func _frame_5():
	host.start_invulnerability()
	host.colliding_with_opponent = false

func _frame_7():
	var new_pos = host.opponent.get_pos()
	var new_x = new_pos.x - 30*(host.get_facing_int())
	host.set_pos(new_x, new_pos.y-10)
	host.set_vel(host.opponent.get_vel().x, host.opponent.get_vel().y)
	host.end_invulnerability()
	host.colliding_with_opponent = true
