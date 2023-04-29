extends Node2D

@onready var player_spawner: Node2D = $PlayerSpawner

var player_scene = preload("res://scenes/player.tscn")
var seeker_scene = preload("res://scenes/seeker.tscn")
var wanderer_scene = preload("res://scenes/wanderer.tscn")

var player: Player

func _ready() -> void:
	player = player_scene.instantiate()
	player_spawner.add_child(player)
	
	var seeker = seeker_scene.instantiate()
	seeker.target = player
	seeker.position = Vector2(100, 100)
	add_child(seeker)
	
	var wanderer = wanderer_scene.instantiate()
	wanderer.position = Vector2(300, 100)
	add_child(wanderer)

