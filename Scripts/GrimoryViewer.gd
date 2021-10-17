extends Control

var index_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer/VBoxContainer"
var name_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer2/VBoxContainer"
var requirements_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer3/VBoxContainer"
var ability_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer4/VBoxContainer"
var cost_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer5/VBoxContainer"
var min_level_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer6/VBoxContainer"

var f = [index_line, name_line, requirements_line, ability_line, cost_line, min_level_line]

var s = true

func _ready():
	$FileDialog.current_dir = "user://sheets/"
	$FileDialog.current_path = "user://sheets/"
	$FileDialog.add_filter("*.sheet")
	$ErrorPopup.get_label().align = 1
	$ErrorPopup.get_label().valign = 1
	if Global.curentSheetPath == null:
		$FileDialog.popup_centered()
	_update_grimory()

func _process(delta):
	if Global.curentSheetPath != null:
		if Global.setings["AutoSave"]:
			if s:
				s = false
				$Timer.start(Global.setings["AutoSaveFrequency"])
	
	
	if $AcceptDialog.visible:
		if $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit2.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit3.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit4.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit5.text == "":
			$AcceptDialog.get_ok().disabled = true
		else:
			$AcceptDialog.get_ok().disabled = false
	
	if $AcceptDialog4.visible:
		if $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit2.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit3.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit4.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit5.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit6.text == "" \
		or $AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit7.text == "":
			$AcceptDialog4.get_ok().disabled = true
		else:
			$AcceptDialog4.get_ok().disabled = false

func _update_index():
	Global.curentSheet["g_index"].clear()
	for i in Global.curentSheet["g_names"].size():
		Global.curentSheet["g_index"].insert(Global.curentSheet["g_index"].size(), String(Global.curentSheet["g_index"].size()))

func _update_grimory():
	for i in f:
		_clear_lines(get_node(i))
		pass
	
	if Global.curentSheet != null:
		for i in Global.curentSheet["g_index"].size():
			var index_label = Label.new()
			var name_label = Label.new()
			var requirements_label = Label.new()
			var ability_label = Label.new()
			var cost_label = Label.new()
			var min_level_label = Label.new()
			var labels = [index_label, name_label, requirements_label, ability_label, cost_label, min_level_label]
			index_label.text = Global.curentSheet["g_index"][i]
			name_label.text = Global.curentSheet["g_names"][i]
			requirements_label.text = Global.curentSheet["g_requirements"][i]
			ability_label.text = Global.curentSheet["g_ability"][i]
			cost_label.text = Global.curentSheet["g_cost"][i]
			min_level_label.text = Global.curentSheet["g_min_level"][i]
			for l in labels:
				l.align = 1
				l.valign = 1
			get_node(index_line).add_child(index_label, true)
			get_node(name_line).add_child(name_label, true)
			get_node(requirements_line).add_child(requirements_label, true)
			get_node(ability_line).add_child(ability_label, true)
			get_node(cost_line).add_child(cost_label, true)
			get_node(min_level_line).add_child(min_level_label, true)

func _clear_lines(node):
	var a = node.get_children()
	for i in a:
		if i != null:
			i.queue_free()

func _clear_edit_line():
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit.text = ""
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit2.text = ""
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit3.text = ""
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit4.text = ""
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit5.text = ""
	$AcceptDialog2/VBoxContainer/LineEdit.text = ""
	$AcceptDialog3/VBoxContainer/LineEdit.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit2.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit3.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit4.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit5.text = ""
	$AcceptDialog6/VBoxContainer/LineEdit.text = ""
	

func _print_grimory():
	print("Index: " + String(Global.curentSheet["g_index"]))
	print("Names: " + String(Global.curentSheet["g_names"]))
	print("Requirements: " + String(Global.curentSheet["requirements"]))
	print("Abilitis: " + String(Global.curentSheet["ability"]))
	print("Costs: " + String(Global.curentSheet["g_cost"]))
	print("Min Level: " + String(Global.curentSheet["g_min_level"]))


func _add_abiliity():
	Global.curentSheet["g_index"].insert(Global.curentSheet["g_index"].size(), String(Global.curentSheet["g_index"].size()))
	Global.curentSheet["g_names"].insert(Global.curentSheet["g_names"].size(), $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit.text)
	Global.curentSheet["g_requirements"].insert(Global.curentSheet["g_requirements"].size(), $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit2.text)
	Global.curentSheet["g_ability"].insert(Global.curentSheet["g_ability"].size(), $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit3.text)
	Global.curentSheet["g_cost"].insert(Global.curentSheet["g_cost"].size(), String(int($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit4.text)))
	Global.curentSheet["g_min_level"].insert(Global.curentSheet["g_min_level"].size(), String(int($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit5.text)))
	_clear_edit_line()
	_update_grimory()
	if OS.is_debug_build():
		_print_grimory()

func _remove_abiliity():
	if Global.curentSheet["g_index"].has(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))):
		Global.curentSheet["g_names"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["g_requirements"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["g_ability"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["g_cost"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["g_min_level"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["g_index"].remove(Global.curentSheet["g_index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		_update_index()
	else:
		$ErrorPopup.dialog_text = "NON-EXISTING_INDEX"
		$ErrorPopup.popup_centered()
	_clear_edit_line()
	_update_grimory()
	if OS.is_debug_build():
		_print_grimory()

func _edit_abiliity():
	Global.curentSheet["g_names"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["g_names"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit.text))
	Global.curentSheet["g_requirements"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["g_requirements"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit2.text))
	Global.curentSheet["g_ability"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["g_ability"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit3.text))
	Global.curentSheet["g_cost"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["g_cost"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit4.text))
	Global.curentSheet["g_min_level"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["g_min_level"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit5.text))
	$AcceptDialog4.selected_index = ""
	_clear_edit_line()
	_update_grimory()
	if OS.is_debug_build():
		_print_grimory()

func _use_abiliity():
	if Global.curentSheet["level"] >= int(Global.curentSheet["g_min_level"][int($AcceptDialog6.selected_index)]):
		if Global.curentSheet["mana_vital_energy"] >= int(Global.curentSheet["g_cost"][int($AcceptDialog6.selected_index)]):
			Global.curentSheet["mana_vital_energy"] -= int(Global.curentSheet["g_cost"][int($AcceptDialog6.selected_index)])
		else:
			$ErrorPopup.dialog_text = "Very low mana/vital energy to use"
			$ErrorPopup.popup_centered()
	else:
		$ErrorPopup.dialog_text = "Very low level to use"
		$ErrorPopup.popup_centered()
	$AcceptDialog6.selected_index = ""
	_clear_edit_line()
	_update_grimory()
	if OS.is_debug_build():
		_print_grimory()


func _on_Button_button_down():
	$AcceptDialog.popup_centered()
	pass 

func _on_Button2_button_down():
	$AcceptDialog2.popup_centered()
	pass 

func _on_Button3_button_down():
	$AcceptDialog3.popup_centered()
	pass 

func _on_Button4_button_down():
	$FileDialog.popup_centered()
	pass 

func _on_Button5_button_down():
	$AcceptDialog6.popup_centered()
	pass # Replace with function body.

func _on_AcceptDialog_confirmed():
	_add_abiliity()
	pass 

func _on_AcceptDialog2_confirmed():
	_remove_abiliity()
	pass 

func _on_AcceptDialog3_confirmed():
	$AcceptDialog4.selected_index = String(int($AcceptDialog3/VBoxContainer/LineEdit.text))
	if Global.curentSheet["g_index"].has($AcceptDialog4.selected_index):
		$AcceptDialog4.popup_centered()
	else:
		$ErrorPopup.dialog_text = "NON-EXISTING_INDEX"
		$ErrorPopup.popup_centered()
	pass 

func _on_AcceptDialog4_confirmed():
	_edit_abiliity()
	pass 

func _on_AcceptDialog6_confirmed():
	$AcceptDialog6.selected_index = String(int($AcceptDialog6/VBoxContainer/LineEdit.text))
	if Global.curentSheet["g_index"].has($AcceptDialog6.selected_index):
		_use_abiliity()
	else:
		$ErrorPopup.dialog_text = "NON-EXISTING_INDEX"
		$ErrorPopup.popup_centered()
	pass # Replace with function body.

func _on_TextureButton_button_down():
	get_tree().change_scene("res://Scenes/SheetManager.tscn")
	pass 

func _on_FileDialog_file_selected(path):
	Global.curentSheetPath = path
	var a = SaveSistem.load_data(path)
	for i in Global.curentSheet:
		if i in a:
			Global.curentSheet[i] = a[i]
	_update_grimory()


func _on_Timer_timeout():
	SaveSistem.save_data(Global.curentSheetPath, Global.curentSheet)
	print("Saved")
	if Global.curentSheetPath != null:
		if Global.setings["AutoSave"]:
			$Timer.start(Global.setings["AutoSaveFrequency"])
	pass # Replace with function body.
