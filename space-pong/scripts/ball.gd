extends CharacterBody2D

var started = false
var start_speed = 500
var incremental_speed = 1.0
var angle = [-250, 250]
var pongs = 0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Start") and started == false:
		start_game()
		
	if started:
		var collision = move_and_collide(velocity * delta)
		if collision != null:
			if collision.get_collider().name == "TopWall":
				velocity = velocity.bounce(collision.get_normal()) * incremental_speed
				pongs +=1
				print(pongs)
			else:
				velocity = velocity.bounce(collision.get_normal())
		

func start_game():
	started = true
	velocity.y = -start_speed
	print("Começou")
	velocity.x = angle.pick_random()
	
	# pick_random = escolhe um dos valores de angle
