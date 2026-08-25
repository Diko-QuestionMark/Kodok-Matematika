extends Node2D


@onready var timer = $Timer
@onready var progress_bar = $ProgressBar
@onready var world = $".."
@onready var label = $Label

var data_jumlah_gene
var progress300
var kecepatan_download


func _ready() -> void:
	progress_bar.max_value = 600
	progress_bar.value = 0
	kecepatan_download = "Tinggi"


func _process(_delta: float) -> void:
	data_jumlah_gene = world.jumlah_gene_aktif
	if progress_bar.value >= 300:
		progress300 = true
		
	label.text = str(data_jumlah_gene) + " generator aktif
	kecepatan download: " + kecepatan_download


func _on_timer_timeout() -> void:
	if Global.sudah_menang == false:
		if data_jumlah_gene == 4:
			progress_bar.value += 3
			kecepatan_download = "Tinggi"
		if data_jumlah_gene == 3:
			progress_bar.value += 2
			kecepatan_download = "Sedanng"
		if data_jumlah_gene == 2:
			progress_bar.value += 1
			kecepatan_download = "Lambat"
		if data_jumlah_gene == 1:
			progress_bar.value += 0
			kecepatan_download = "Berhenti"
		if data_jumlah_gene == 0:
			kecepatan_download = "Gagal"
			Global.sudah_kalah = true
	
	if progress_bar.value >= progress_bar.max_value:
		Global.sudah_menang = true
