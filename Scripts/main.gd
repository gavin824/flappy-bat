extends Node2D

@onready var o: PackedScene = preload("res://Scenes/obstacles.tscn")
var vp_width = 320

func _ready() -> void:
	### Starting score
	Autoload.score = 0
	
func _process(_delta: float) -> void:
	### Loading the score
	$CanvasLayer/Control/Label.text = str(Autoload.score)


func _on_timer_timeout() -> void:
	### changes where the obstacles are
	var oi = o.instantiate()
	var modifiers = [-0.3,-0.2,-0.1,0,0.1,0.2,0.3]
	var st_scale = randf_range(1.2,2.8)
	var sm_scale = 4 - st_scale + modifiers.pick_random()
	oi.position.x = vp_width
	
	### Changes how many frames there are
	if oi.get_child_count() > 0:
		oi.get_child(0).scale = Vector2(st_scale,st_scale)
		oi.get_child(0).get_child(0).frame = randi_range(0,3)
		
	### Ending frame
	if oi.get_child_count() > 1:
		oi.get_child(1).scale = Vector2(sm_scale,sm_scale)
		oi.get_child(1).get_child(0).frame = randi_range(0,3)
	
	add_child(oi)
	$Timer.start()
