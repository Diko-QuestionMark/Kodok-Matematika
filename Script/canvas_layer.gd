extends CanvasLayer

@onready var game_timer = $"../GameTimer"

func _process(delta: float) -> void:
	if Global.sudah_menang == true:
		game_timer.stop()
		$Game.show()
