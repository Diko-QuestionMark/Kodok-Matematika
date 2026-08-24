extends Node2D

@onready var game_timer = $GameTimer
@onready var time_label = $CanvasLayer/Time
@onready var gene1 = $Generator1
@onready var gene2 = $Generator2
@onready var gene3 = $Generator3
@onready var gene4 = $Generator4

var jumlah_gene_aktif = 4
var a
var b
var c
var d
var progres1


func _process(delta: float) -> void:
	time_label.text = str(int(game_timer.wait_time - ((game_timer.wait_time - game_timer.time_left) / game_timer.wait_time) * 100), " ")
	if Global.sudah_menang:
		Global.sudah_menang = false
		await get_tree().create_timer(5).timeout
		SceneTransition.change_scene("res://Scene/menu.tscn")
	if Global.sudah_kalah:
		Global.sudah_kalah = false
		await get_tree().create_timer(5).timeout
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
	Global.sudah_kalah = false


func _on_laptop_1_progress_200() -> void:
	progres1 = true
