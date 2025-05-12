extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 4.2
const ATTACK_RANGE = 2.0
var player = null
var health = 6

@export var player_path := "/root/World/Map/Player"

@export var damage := 1	

signal body_part_hit(dam)

func _ready():
	player = get_node(player_path)

func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED

	velocity = velocity.move_toward(new_velocity, 0.25)
	move_and_slide()

func update_target_location(target_location):
	nav_agent.target_position = target_location
	

func _target_in_range():
	return global_position.distance_to(player.global_position) < ATTACK_RANGE
	
func _on_navigation_agent_3d_target_reached():
	if global_position.distance_to(player.global_position) < ATTACK_RANGE + 1.0 :
		var dir = global_position.direction_to(player.global_position)
		player.hit(dir)

func hit():
	_on_collision_shape_3d_body_part_hit(1)



func _on_collision_shape_3d_body_part_hit(dam):
	health -= dam
	if health <= 0:
		var world = get_tree().get_root().get_node("World")
		if world and world.has_method("add_score"):
			world.add_score(1)
		queue_free()
