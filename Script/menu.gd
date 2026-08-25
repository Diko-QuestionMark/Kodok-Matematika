extends Node2D

@onready var berhasil_gagal = $BerhasilGagal

func _ready() -> void:
	pass
	#var music_bus = AudioServer.get_bus_index("Music")
	#AudioServer.set_bus_effect_enabled(music_bus, 0, true)
	Global.sudah_kalah = false
	Global.sudah_menang = false
	berhasil_gagal.text = "Berhasil: " + str(Global.jumlah_berhasil) + "
	" + "Gagal: " + str(Global.jumlah_gagal)

func _on_mulai_pressed() -> void:
	SceneTransition.change_scene("res://Scene/world.tscn")


func _on_cara_bermain_pressed() -> void:
	pass # Replace with function body.


func _on_keluar_pressed() -> void:
	get_tree().quit()
