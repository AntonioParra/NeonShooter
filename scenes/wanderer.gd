extends CharacterBody2D

const MAX_SPEED = 400

var velocity_aux: Vector2

var alive: bool = true

func _init() -> void:
	velocity = Vector2.from_angle(randf()*2*PI)


func _physics_process(delta: float) -> void:
	if not alive:
		return
		
	rotation += delta

	velocity = velocity.normalized() * MAX_SPEED
	
	velocity_aux = velocity
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("Wall"):
			var normal = collision.get_normal()
			if(absf(normal.x) > 0.5):
				velocity.x = -1 * velocity_aux.x
			if(absf(normal.y) > 0.5):
				velocity.y = -1 * velocity_aux.y
