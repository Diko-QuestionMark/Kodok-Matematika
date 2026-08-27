extends Node2D

@onready var berhasil_gagal = $Camera2D/BerhasilGagal
@onready var cara_bermain = $CanvasLayer

func _ready() -> void:
	SaveLoad._load()
	#var music_bus = AudioServer.get_bus_index("Music")
	#AudioServer.set_bus_effect_enabled(music_bus, 0, true)
	Global.sudah_kalah = false
	Global.sudah_menang = false
	berhasil_gagal.text = "Berhasil: " + str(Global.jumlah_berhasil) + "
	" + "Gagal: " + str(Global.jumlah_gagal)

func _on_mulai_pressed() -> void:
	SceneTransition.change_scene("res://Scene/world.tscn")


func _on_cara_bermain_pressed() -> void:
	cara_bermain.show()


func _on_keluar_pressed() -> void:
	get_tree().quit()


func _on_tutup_pressed() -> void:
	cara_bermain.hide()
