extends Node2D

@onready var game_timer = $GameTimer
@onready var time_label = $CanvasLayer/Time

var jumlah_gene_aktif = 4

func _process(delta: float) -> void:
	time_label.text = str(int(game_timer.wait_time - ((game_timer.wait_time - game_timer.time_left) / game_timer.wait_time) * 100))
	if Global.sudah_menang:
		Global.sudah_menang = false
		await get_tree().create_timer(5).timeout
		SceneTransition.change_scene("res://Scene/menu.tscn")


func _on_game_timer_timeout() -> void:
	pass # Replace with function body.
