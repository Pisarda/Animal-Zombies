extends Node2D

@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH
	$"../Label".text = str(health) + "hp"
	
func damage(attack):
	health -= attack
	$"../Label".text = str(health) + "hp"
	if health <= 0:
		get_parent().queue_free()
	
