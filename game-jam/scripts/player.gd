extends CharacterBody2D

var posiciones = [
	Vector2(-512.0, 0),
	Vector2(-256.0, 0),
	Vector2(0.0, 0),
	Vector2(256.0, 0),
	Vector2(512.0, 0)
]
var vector_posicion:int = 2
var speed:int = 10

func _ready() -> void:
	position = Vector2(0, 128.0)

func _process(delta: float) -> void:
	var direccion_movimiento_en_y = Input.get_axis("w", "s")
	position.y += direccion_movimiento_en_y * speed
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("a") or Input.is_action_pressed("s") or Input.is_action_pressed("w") or Input.is_action_pressed("d"):
		$AnimatedSprite2D.play("caminar")
	else:
		$AnimatedSprite2D.play("default")
	if Input.is_action_just_pressed("d") and vector_posicion <= 3:
		vector_posicion += 1
	elif Input.is_action_just_pressed("a") and vector_posicion >= 1:
		vector_posicion -= 1
	else:
		pass
	position.x = posiciones[vector_posicion].x
