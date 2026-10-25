extends Label

func _ready() -> void:
	sumar_puntos()

func sumar_puntos() -> void:
	while is_inside_tree():
		await get_tree().create_timer(1.0).timeout
		Global.puntos += 10

func _process(delta: float) -> void:
	text = "PUNTUACION: " + str(Global.puntos)
