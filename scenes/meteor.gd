extends Area2D

var rng = RandomNumberGenerator.new()
var speed: int
var rotation_speed: int

signal  meteor_collision

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

#count the meteor hit user
func _on_body_entered(body):
	$MeteorHitPlayerSound.play()
	meteor_collision.emit()


func _on_area_entered(area):
	area.queue_free() # remove laser

	$MeteorExplodingShound.play() # play explosion sound
	
	# hide the graphic to wait for audio to play before remove the object
	$Sprite2D.hide()
	await get_tree().create_timer(0.5).timeout
	
	queue_free()
