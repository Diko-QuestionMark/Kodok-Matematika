extends Node2D

@onready var game_timer = $GameTimer
@onready var time_label = $CanvasLayer/Time
@onready var gene1 = $Generator1
@onready var gene2 = $Generator2
@onready var gene3 = $Generator3
@onready var gene4 = $Generator4
@onready var victory_sound = $Victory
@onready var defeat_sound = $Defeat

var jumlah_gene_aktif = 4
var a
var b
var c
var d
var progres1
var sudah = false


func _ready() -> void:
	pass
	#var music_bus = AudioServer.get_bus_index("Music")
	#AudioServer.set_bus_effect_enabled(music_bus, 0, false)

func _process(delta: float) -> void:
	time_label.text = str(int(game_timer.time_left))
	if Global.sudah_menang:
		Global.sudah_menang = false
		MusicManager.volume_db = -100.0
		if !sudah:
			Global.jumlah_berhasil += 1
			victory_sound.play()
			sudah = true
		await get_tree().create_timer(8).timeout
		MusicManager.volume_db = -5.0
		SceneTransition.change_scene("res://Scene/menu.tscn")
	if Global.sudah_kalah:
		Global.sudah_kalah = false
		MusicManager.volume_db = -100.0
		if !sudah:
			Global.jumlah_gagal += 1
			defeat_sound.play()
			sudah = true
		await get_tree().create_timer(8).timeout
		MusicManager.volume_db = -5.0
		SceneTransition.change_scene("res://Scene/menu.tscn")
	if gene1.gene_on:
		a = 1
	else :
		a = 0
	if gene2.gene_on:
		b = 1
	else :
		b = 0
	if gene3.gene_on:
		c = 1
	else :
		c = 0
	if gene4.gene_on:
		d = 1
	else :
		d = 0
	jumlah_gene_aktif = a + b + c + d


func _on_game_timer_timeout() -> void:
	Global.sudah_kalah = true
	Global.jumlah_gagal += 1


func _on_laptop_1_progress_200() -> void:
	progres1 = true
