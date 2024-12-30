class_name UIPlayerHealthBar
extends ProgressBar


## Sets the initial max value of the progress bar to [member amount]. [br]
## By default, it also sets [member value], but if you don't want that to happen,
## just set the second parameter [member _set_max] to [code]false[/code]
func set_max_health(amount: float, _set_max: bool = true) -> void:
	max_value = amount

	if _set_max:
		value = max_value

## Sets the current value of the progress bar to [member amount], where amount should be a positive or negative number.[br]
## [i]Eg. Taking damage is probably negative, healing is probably positive.[/i][br.]
## There's also a built in Tween, to make it look nice.[br]
## [param _use_tween] can be set to [code]false[/code] to disable it.[br]
## The others should be self explanatory.
func set_health(amount: float, _use_tween: bool = true, _duration: float = 0.1, _easing: Tween.EaseType = Tween.EASE_IN_OUT) -> void:
	if _use_tween:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(
			self,
			^'value',
			value + amount,
			_duration
		).set_ease(_easing)
	else:
		value += amount
