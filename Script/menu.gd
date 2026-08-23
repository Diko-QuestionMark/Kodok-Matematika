extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mulai_pressed() -> void:
	SceneTransition.change_scene("res://Scene/world.tscn")


func _on_cara_bermain_pressed() -> void:
	pass # Replace with function body.


func _on_keluar_pressed() -> void:
	get_tree().quit()
