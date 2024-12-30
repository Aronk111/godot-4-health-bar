## Represents the health of an object.
class_name HealthComponent
extends Node


## Maximum possible health of an object.
@export var max_health: float = 1
## Wether or not the [member current_health] is allowed to go below 0.
@export var allow_negative: bool = false
## Current health of the object. [br]
## Any time it's changed [signal on_health_changed] is emitted
var current_health: float :
	set(value):
		var previous: float = current_health
		current_health = value
		on_health_changed.emit(current_health - previous)

## Emitted any time a change is detected on [member current_health]
signal on_health_changed(change: float, current: float)
## Emitted any time the player is healed.
signal on_heal(amount: float, current: float)
## Emitted any time the player is damaged.
signal on_damage(amount: float, current: float)


func _ready() -> void:
	current_health = max_health

## Damages the 'player' a certain [param amount]
func take_damage(amount: float) -> void:
	current_health -= amount
	if current_health <= 0 and not allow_negative:
		current_health = 0
	on_damage.emit(amount, current_health)

## Heals the 'player' a certain [param amount]
func heal(amount: float) -> void:
	current_health += amount
	if current_health >= max_health:
		current_health = max_health
	on_heal.emit(amount, current_health)
