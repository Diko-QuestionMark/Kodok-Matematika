extends CanvasLayer

@onready var game_timer = $"../GameTimer"
@onready var layar_pause = $LayarPause
@onready var layar_task = $Task
@onready var tombol_sembunyikan = $Sembunyikan

var menyembunyikan = true

func _process(delta: float) -> void:
	if Global.sudah_menang:
		game_timer.stop()
		$GameMenang.show()
	if Global.sudah_kalah:
		game_timer.stop()
		$GameKalah.show()


func _on_pause_button_pressed() -> void:
	layar_pause.show()
	get_tree().paused = true


func _on_lanjut_pressed() -> void:
	get_tree().paused = false
	layar_pause.hide()


func _on_ke_menu_pressed() -> void:
	get_tree().paused = false
	SceneTransition.change_scene("res://Scene/menu.tscn")


func _on_sembunyikan_pressed() -> void:
	if menyembunyikan:
		tombol_sembunyikan.text = "tampilkan tugas"
		layar_task.hide()
		menyembunyikan = false
	else:
		tombol_sembunyikan.text = "sembunyikan tugas"
		layar_task.show()
		menyembunyikan = true
