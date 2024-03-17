extends Node2D

# load the meteor scence
var meteor_scence: PackedScene = load("res://scenes/meteor.tscn")


func _on_meteor_timer_timeout():
	# initiate meteor
	var meteor = meteor_scence.instantiate()
	
	# add new meteor to the main scenec
	$Meteors.add_child(meteor)
