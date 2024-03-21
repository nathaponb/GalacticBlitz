extends Control

var main_scence: PackedScene = load("res://scenes/universe.tscn")

func _ready():
	print("game over ready")
	$GameOverSound.play()
	$CenterContainer/VBoxContainer/Label.text = $CenterContainer/VBoxContainer/Label.text + str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_packed(main_scence)
