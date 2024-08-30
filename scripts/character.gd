extends CharacterBody2D

@export var ACCELERATION = 1400
@export var MAX_SPEED = 120
@export var FRICTION = 800

func _process(delta: float) -> void:
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    input_vector = input_vector.normalized()

    if input_vector != Vector2.ZERO:
        velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
    else:
        velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

    # flip the sprite to face the left-right direction the char is moving in
    if velocity.x != 0:
        $Sprite2D.flip_h = velocity.x >= 0

    move_and_slide()
