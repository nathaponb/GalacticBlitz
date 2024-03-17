extends Area2D

var rng = RandomNumberGenerator.new()
var speed: int
var rotation_speed: int

func _ready():
	# randomize meteor position
	var viewport_width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, viewport_width) # random number in range of width viewport
	var random_y = rng.randi_range(-100, -50) # start off Y viewport to the top
	position = Vector2(random_x, random_y) # set meteor random position
	
	# randomize meteor graphic
	var random_graphic = rng.randi_range(1, 8)
	$Sprite2D.texture = load("res://graphics/png/Meteors/meteor" + str(random_graphic) + ".png")
	
	# randomize speed
	speed = rng.randi_range(200, 500)
	
	# randomize rotation speed
	rotation_speed = rng.randi_range(40, 100)
	
func _process(delta):
	position += Vector2(0, 1.0) * speed * delta # move the meteor
	rotation_degrees += rotation_speed * delta
	
func _on_body_entered(body):
	pass
