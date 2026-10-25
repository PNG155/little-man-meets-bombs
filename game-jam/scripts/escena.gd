extends Node2D

var random_tiempo:float = 0
var bomba = preload("res://scenes/bomba.tscn")
@onready var spawn = [$Node2D,$Node2D2,$Node2D3,$Node2D4,$Node2D5]
var spawn_elegido 
var maximo = 4

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	timer()


func timer():
	spawn_elegido = spawn.pick_random()
	random_tiempo = randi_range(0.1, maximo)
	await get_tree().create_timer(random_tiempo).timeout
	var generar_bomba = bomba.instantiate()
	generar_bomba.position = Vector2(spawn_elegido.position)
	add_child(generar_bomba)
	if maximo <= 0.5:
		maximo -= 0.1
	timer()
