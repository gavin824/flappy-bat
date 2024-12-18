extends Node2D

@export var speed: int = 100


func _physics_process(delta: float) -> void:
	### Speed speed flight
	position.x -= speed * delta


func _on_stalactite_body_entered(_body: Node2D) -> void:
	### Top obstacle
	get_tree().call_deferred("reload_current_scene")


func _on_stalagmite_body_entered(_body: Node2D) -> void:
	### bottom obstacle
	get_tree().call_deferred("reload_current_scene")


func _on_score_body_entered(_body: Node2D) -> void:
	### Adds a point when passing an obstacle
	Autoload.score += 1


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### Loading speed
	queue_free()
