extends Node2D

@onready var timer = $Timer
@onready var progress_bar = $ProgressBar

func _process(_delta: float) -> void:
	if Global.sudah_menang == false:
		progress_bar.value = (timer.wait_time - timer.time_left) / timer.wait_time * 100

func _on_timer_timeout() -> void:
	Global.sudah_menang = true
