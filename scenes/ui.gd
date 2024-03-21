extends CanvasLayer

var health_image = load("res://graphics/png/UI/playerLife1_orange.png")

var time_elapsed := 0

func set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# set new health
	for i in amount:
		var texture_rect = TextureRect.new()
		texture_rect.texture = health_image # set texture to node
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(texture_rect) # append updated player health


func _on_score_timer_timeout():
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed # set score to global variable for use in game over scene
