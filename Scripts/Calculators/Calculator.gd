extends Control

func _input(event):
	if $TabContainer.current_tab == 0:
		if event.is_action_pressed("short_fisico"):
			$TabContainer/Damage/TabContainer.current_tab = 0
		elif event.is_action_pressed("short_distancia"):
			$TabContainer/Damage/TabContainer.current_tab = 1
		elif event.is_action_pressed("short_especial"):
			$TabContainer/Damage/TabContainer.current_tab = 2
	if event.is_action_pressed("short_damage"):
		$TabContainer.current_tab = 0
	elif event.is_action_pressed("short_status"):
		$TabContainer.current_tab = 1
	elif event.is_action_pressed("short_hurt"):
		$TabContainer.current_tab = 2

func _on_TextureButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.

