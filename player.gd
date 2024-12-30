class_name Player
extends Node2D


@onready var health_component: HealthComponent = $HealthComponent
@onready var health_bar: UIPlayerHealthBar = %HealthBar


func _ready() -> void:
	health_bar.set_max_health(health_component.max_health)

	# connecting health events
	health_component.on_heal.connect(_on_heal)
	health_component.on_damage.connect(_on_damage)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# take damage when left clicking
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				health_component.take_damage(0.1)

		# heal when right clicking
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				health_component.heal(0.1)


func _on_heal(amount: float, _current: float) -> void:
	health_bar.set_health(amount)

func _on_damage(amount: float, _current: float) -> void:
	health_bar.set_health(-amount)
