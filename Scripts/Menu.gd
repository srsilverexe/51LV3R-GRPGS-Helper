extends Control

func _nofunc():
	var f = Global.noFunc.instance()
	get_parent().add_child(f)
	f.popup_centered()
	f.popup()

func _on_Button_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Calculator.tscn")
	pass # Replace with function body.

func _on_Button2_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/SheetMaker.tscn")
	pass # Replace with function body.

func _on_Button3_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Dices.tscn")
	pass # Replace with function body.

func _on_ButtonConfigs_button_down():
	_nofunc()
	pass # Replace with function body.

func _on_ButtonQuit_button_down():
	get_tree().quit()
	pass # Replace with function body.

