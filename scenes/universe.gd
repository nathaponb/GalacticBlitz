extends Node2D

# load the meteor scence
var meteor_scence: PackedScene = load("res://scenes/meteor.tscn")
var laser_scence: PackedScene = load("res://scenes/laser.tscn")
var gameover_scence: PackedScene = load("res://scenes/game_over.tscn")

var health = 3

func _ready():
	get_tree().call_group("ui", "set_health", health) # set initial player health


func _on_meteor_timer_timeout():
	# initiate meteor
	var meteor = meteor_scence.instantiate()
	
	# add new meteor to the main scenec
	$Meteors.add_child(meteor)
	
	# attach signal to the instantiated meteor object
	#count the meteor hit user
	meteor.connect("meteor_collision", on_meteor_collision)


func _on_player_laser(pos):
	var laser = laser_scence.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	
#count the meteor hit user
func on_meteor_collision():
	health -= 1 # reduce player health by 1
	get_tree().call_group("ui", "set_health", health) # set player health on display ui
	if health <= 0:
		get_tree().change_scene_to_packed(gameover_scence)
