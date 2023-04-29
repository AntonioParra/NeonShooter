extends CharacterBody2D
class_name Player

const ACCELERATION_MULT = 500
const MAX_SPEED = 500

var velocity_aux: Vector2
var acceleration: Vector2
var alive: bool = true


func _physics_process(delta: float) -> void:
	if not alive:
		return
	
	look_at(get_global_mouse_position())
	
	
	acceleration = Vector2.ZERO
	
	if Input.is_action_pressed("z_left"):
		acceleration.x -= 1
	if Input.is_action_pressed("z_right"):
		acceleration.x += 1
	if Input.is_action_pressed("z_up"):
		acceleration.y -= 1
	if Input.is_action_pressed("z_down"):
		acceleration.y += 1
	
	velocity += acceleration.normalized() * ACCELERATION_MULT * delta
	velocity *= 0.99
	
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	velocity_aux = velocity
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("Wall"):
			velocity = velocity_aux.bounce(collision.get_normal())
		if collider.is_in_group("Enemy"):
			velocity = velocity_aux.bounce(collision.get_normal())
