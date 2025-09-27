extends Node2D

@onready var ball = $Ball
@onready var label_pongs = $Pongs
@onready var label_turorial = $Tutorial

func _process(delta: float) -> void:
	
	if ball.started:
		label_pongs.visible = true
		label_turorial.visible = false
	label_pongs.text = str(ball.pongs)


func _on_hole_body_entered(body: Node2D) -> void:
	# essa linha reseta o game
	get_tree().reload_current_scene()
