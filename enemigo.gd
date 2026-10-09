extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x=-SPEED
	
	if $RayCast2D.is_colliding():
		velocity.x=-SPEED*2

	move_and_slide()


func _on_area_muerte_2d_body_entered(body: Node2D) -> void:
	if body.name=="PJ":
		deshabilitar_colision()

func deshabilitar_colision()-> void:
	$CollisionShape2D.set_deferred("disabled", true)
	$AreaMuerte2D.set_deferred("monitoring", false)
	
		
