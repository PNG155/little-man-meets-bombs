extends RigidBody2D

const SPEED = 5
var movimiento = Vector2(0, 1)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += SPEED*movimiento


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
