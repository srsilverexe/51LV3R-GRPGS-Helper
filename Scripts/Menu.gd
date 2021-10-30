extends Control

func _nofunc():
	var f = Global.noFunc.instance()
	get_parent().add_child(f)
	f.popup_centered()
	f.popup()

func _on_Button_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Calculator.tscn")
	pass 

func _on_Button2_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/SheetManager.tscn")
	pass 

func _on_ButtonDices_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Dices.tscn")
	pass 

func _on_ButtonConfigs_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Settings.tscn")
	pass 

func _on_ButtonQuit_button_down():
	get_tree().quit()
	pass 


func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)
	pass # Replace with function body.
