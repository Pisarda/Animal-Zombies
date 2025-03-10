extends CharacterBody2D

var speed = 50

func _physics_process(delta):
	if Global.Player == null:
		return
	
	var pos_to_plr = Global.Player.global_position - global_position
	pos_to_plr = pos_to_plr.normalized()
	move_and_collide(pos_to_plr * speed * delta)
	
	look_at(Global.Player.position)
