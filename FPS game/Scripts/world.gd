extends Node3D

@onready var hit_rect = $UI/HitRect
@onready var spawns = $Map/Spawns
@onready var navigation_region = $Map/NavigationRegion3D
@onready var player = $Map/Player
@onready var score_label: Label = $CanvasLayer/ScoreLabel



var zombie = load("res://Scenes/zombie.tscn")
var instance
var enemy= load("res://Scenes/Enemy.tscn")
var score: int = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()	
	update_score()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_player_hit():
	hit_rect.visible = true
	await get_tree().create_timer(0.2).timeout
	hit_rect.visible = false


func _get_random_child(parent_node):
	var random_id = randi() % parent_node.get_child_count()
	return parent_node.get_child(random_id)

func _on_zombie_spawn_timer_timeout():
	var spawn_point = _get_random_child(spawns).global_position
	instance = enemy.instantiate()
	instance.position = spawn_point
	navigation_region.add_child(instance)

func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)

# Score
func add_score(points: int):
	score += points
	update_score()

func update_score():
	score_label.text = "Score: %d" % score


	
