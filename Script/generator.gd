extends Node2D

@onready var label = $Fix
@onready var health_bar = $ProgressBar
@onready var sprite = $AnimatedSprite2D
@onready var layar_perbaikan = $LayarPerbaikan
@onready var label_soal = $LayarPerbaikan/Panel/Label
@onready var button1 = $LayarPerbaikan/Panel/HBoxContainer/Button1
@onready var button2 = $LayarPerbaikan/Panel/HBoxContainer/Button2
@onready var button3 = $LayarPerbaikan/Panel/HBoxContainer/Button3
@onready var button4 = $LayarPerbaikan/Panel/HBoxContainer/Button4
@onready var label_koreksi = $BenarSalah/BenarSalah
@onready var laptop = $"../Laptop1"
@onready var timer = $Timer
@onready var correct_sound = $Correct
@onready var false_sound = $False

var health = 10
var on_area = false
var gene_on = true
var a
var opsi = []
var jawaban_benar


func _ready() -> void:
	health_bar.value = health
	sprite.play("on")


func _process(_delta: float) -> void:
	if laptop.progress300:
		print("balelo")
		timer.wait_time = 3

	if Global.sudah_menang || Global.sudah_kalah:
		tutup_layar_perbaikan()
	
	if on_area && health != 10:
		label.show()
	else:
		label.hide()
	
	if on_area == true && Input.is_action_just_pressed("interact") && health != 10 && !layar_perbaikan.visible:
		a = GenerateSoal.generate_soal()
		opsi = a[2]
		jawaban_benar = opsi[0]
		opsi.shuffle()
		print(opsi)
		label_soal.text = str(a[0], " + ", a[1], " = ?")
		button1.text = str(opsi[0])
		button2.text = str(opsi[1])
		button3.text = str(opsi[2])
		button4.text = str(opsi[3])
		
		Global.panel_aktif = true
		layar_perbaikan.show()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		on_area = true
		pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		on_area = false
		pass


func _on_timer_timeout() -> void:
	if gene_on == true:
		health -= randi_range(0,2)
		if health <= 0:
			health = 0
			gene_on = false
			sprite.play("off")
		health_bar.value = health


func _on_exit_pressed() -> void:
	tutup_layar_perbaikan()


func _on_button_1_pressed() -> void:
	cek_jawaban(opsi[0])
	tutup_layar_perbaikan()


func _on_button_2_pressed() -> void:
	cek_jawaban(opsi[1])
	tutup_layar_perbaikan()


func _on_button_3_pressed() -> void:
	cek_jawaban(opsi[2])
	tutup_layar_perbaikan()


func _on_button_4_pressed() -> void:
	cek_jawaban(opsi[3])
	tutup_layar_perbaikan()


func tutup_layar_perbaikan() -> void:
	Global.panel_aktif = false
	layar_perbaikan.hide()


func buka_layar_perbaikan() -> void:
	Global.panel_aktif = true
	layar_perbaikan.show()


func cek_jawaban(button: int) -> void:
	if button == jawaban_benar:
		health += 6
		if health > 10:
			health = 10
		print("benar")
		correct_sound.stop()
		correct_sound.play()
		label_koreksi.text = "BENAR"
		$AnimationPlayer.stop()
		$AnimationPlayer.play("ShowBenarSalah")
		gene_on = true
		sprite.play("on")
	else:
		health -= 6
		if health < 0:
			gene_on = false
			sprite.play("off")
			health = 0
		print("salah")
		false_sound.stop()
		false_sound.play()
		label_koreksi.text = "SALAH"
		$AnimationPlayer.stop()
		$AnimationPlayer.play("ShowBenarSalah")
	health_bar.value = health
