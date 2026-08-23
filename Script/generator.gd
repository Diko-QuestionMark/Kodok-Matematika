extends Node2D

@onready var label = $Fix
@onready var health_bar = $ProgressBar
@onready var sprite = $AnimatedSprite2D
@onready var layar_perbaikan = $LayarPerbaikan


var health = 10
var on_area = false
var gene_on = true


func _ready() -> void:
	health_bar.value = health
	sprite.play("on")


func _process(_delta: float) -> void:
	if on_area == true && Input.is_action_just_pressed("interact"):
		Global.panel_aktif = true
		layar_perbaikan.show()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		label.show()
		on_area = true
		pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		label.hide()
		on_area = false
		pass


func _on_timer_timeout() -> void:
	if gene_on == true:
		health -= randi_range(0,3)
		if health <= 0:
			health = 0
			gene_on = false
			sprite.play("off")
		health_bar.value = health


func _on_exit_pressed() -> void:
	tutup_layar_perbaikan()


func _on_button_1_pressed() -> void:
	tutup_layar_perbaikan()


func _on_button_2_pressed() -> void:
	tutup_layar_perbaikan()


func _on_button_3_pressed() -> void:
	tutup_layar_perbaikan()


func _on_button_4_pressed() -> void:
	tutup_layar_perbaikan()


func tutup_layar_perbaikan() -> void:
	Global.panel_aktif = false
	layar_perbaikan.hide()


func buka_layar_perbaikan() -> void:
	Global.panel_aktif = true
	layar_perbaikan.show()
