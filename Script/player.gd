extends CharacterBody2D

@export var SPEED : float = 200
@onready var interactArea = $InteractArea
@onready var hand = $Hand
var weapon
var weaponDetected = false
var character_direction : Vector2
 
@onready var sprite = $sprite


func _ready():
	Global.Player = self

func _physics_process(delta):
	if Input.is_action_just_pressed("test"):
		$HealthComponent.damage(1)
	
	if get_global_mouse_position().x < global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	character_direction.x = Input.get_axis("left", "right")
	character_direction.y = Input.get_axis("up", "down")
	
	if character_direction:
		if sprite.flip_h == true: 
			if character_direction.x > 0:
				sprite.play("walk", -1.0, true)
			else:
				sprite.play("walk", 1.0, false)
					
		if sprite.flip_h == false: 
			if character_direction.x < 0:
				sprite.play("walk", -1.0, true)
			else:
				sprite.play("walk", 1.0, false)
	
		velocity = character_direction * SPEED
		if sprite.animation != "walk": sprite.animation = "walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		if sprite.animation != "idle": sprite.animation = "idle"
		
		
	if weaponDetected:
		if Input.is_action_just_pressed("interact"):
			weapon.equip()
			weapon.reparent(hand)
			weapon.set_position(Vector2(0.0, 0.0))
		
	move_and_slide()
	
func _on_interact_area_area_entered(area):
	if area in get_tree().get_nodes_in_group("Weapons"):
		print("WEAPON DETECTED")
		weaponDetected = true
		weapon = area.get_parent()

func _on_interact_area_area_exited(area):
	if weaponDetected:
		print("EXIT")
		weaponDetected = false
		weapon = null
		
		
		
	
 
