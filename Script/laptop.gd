extends Node2D


@onready var timer = $Timer
@onready var progress_bar = $ProgressBar
@onready var world = $".."

var data_jumlah_gene
var progress300


func _ready() -> void:
	progress_bar.max_value = 600
	progress_bar.value = 0


func _process(_delta: float) -> void:
	data_jumlah_gene = world.jumlah_gene_aktif
	if progress_bar.value >= 300:
		progress300 = true


func _on_timer_timeout() -> void:
	if Global.sudah_menang == false:
		if data_jumlah_gene == 4:
			progress_bar.value += 3
		if data_jumlah_gene == 3:
			progress_bar.value += 2
		if data_jumlah_gene == 2:
			progress_bar.value += 1
		if data_jumlah_gene == 1:
			progress_bar.value += 0
		if data_jumlah_gene == 0:
			Global.sudah_kalah = true
	
	if progress_bar.value >= progress_bar.max_value:
		Global.sudah_menang = true
