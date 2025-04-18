extends CharacterBody3D

var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 4.8
const SENSITIVITY = 0.004
const HIT_STAGGER = 6.0


#fov variables
const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

signal player_hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8


# Bullets
var bullet = load("res://Scenes/Bullet.tscn")
var instance 


@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var gun_anim = $Head/Camera3D/Rifle/AnimationPlayer
@onready var gun_anim2 = $Head/Camera3D/Rifle2/AnimationPlayer
@onready var gun_barrel = $Head/Camera3D/Rifle/RayCast3D
@onready var gun_barrel2 = $Head/Camera3D/Rifle2/RayCast3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))
		
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		release_mouse()
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		capture_mouse()

func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Sprint.
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
	
	
	
	# FOV
	var velocity_clamped = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
	# shooting
	if Input.is_action_pressed("shoot"):
		if !gun_anim.is_playing():
			gun_anim.play("Shoot")
			instance = bullet.instantiate()
			instance.position = gun_barrel.global_position
			instance.transform.basis = gun_barrel.global_transform.basis
			get_parent().add_child(instance)
	
	if Input.is_action_pressed("shoot"):
		if !gun_anim2.is_playing():
			gun_anim2.play("Shoot")
			instance = bullet.instantiate()
			instance.position = gun_barrel2.global_position
			instance.transform.basis = gun_barrel2.global_transform.basis
			get_parent().add_child(instance)

	move_and_slide()

func hit(dir):
	emit_signal("player_hit")
	velocity += dir * HIT_STAGGER
	

