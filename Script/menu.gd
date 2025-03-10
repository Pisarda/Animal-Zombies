extends VBoxContainer

@onready var menuclick = $Menuclick
@onready var buttonzoomsound = $Buttonzoomsound


const WORLD = preload("res://Scenes/World.tscn")

func _on_newgame_pressed() -> void:
	get_tree().change_scene_to_packed(WORLD)
	
	


func _on_quit_pressed() -> void:
	get_tree().quit()
