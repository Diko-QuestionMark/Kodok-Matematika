extends Node2D

@onready var timer = $Timer
@onready var progress_bar = $ProgressBar
@onready var world = $".."

var data_jumlah_gene


func _ready() -> void:
	progress_bar.max_value = 600


func _process(_delta: float) -> void:
	data_jumlah_gene = world.jumlah_gene_aktif


func _on_timer_timeout() -> void:
	print(data_jumlah_gene)
	if Global.sudah_menang == false:
		if data_jumlah_gene == 4:
			progress_bar.value += 5
		if data_jumlah_gene == 3:
			progress_bar.value += 3
		if data_jumlah_gene == 2:
			progress_bar.value += 1
		if data_jumlah_gene == 1:
			progress_bar.value += 0
		if data_jumlah_gene == 0:
			Global.sudah_kalah = true
	
	if progress_bar.value >= 1000:
		Global.sudah_menang = true
