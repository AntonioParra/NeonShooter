extends Node2D

@onready var player_spawner: Node2D = $PlayerSpawner

var player_scene = preload("res://scenes/player.tscn")
var player: Player

func _ready() -> void:
	player = player_scene.instantiate()
	player_spawner.add_child(player)

