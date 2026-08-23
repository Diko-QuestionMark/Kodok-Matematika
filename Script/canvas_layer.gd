extends CanvasLayer

@onready var game_timer = $"../GameTimer"

func _process(delta: float) -> void:
	if Global.sudah_menang:
		game_timer.stop()
		$GameMenang.show()
	if Global.sudah_kalah:
		game_timer.stop()
		$GameKalah.show()
