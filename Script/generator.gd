extends Node2D

@onready var label = $Fix
@onready var health_bar = $ProgressBar
@onready var sprite = $AnimatedSprite2D

var health = 10
var on_area = false
var gene_on = true


func _ready() -> void:
	health_bar.value = health
	sprite.play("on")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		label.show()
		on_area = true
		pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		label.hide()
		on_area = true
		pass


func _on_timer_timeout() -> void:
	if gene_on == true:
		health -= randi_range(0,2)
		if health <= 0:
			health = 0
			gene_on = false
			sprite.play("off")
		health_bar.value = health
