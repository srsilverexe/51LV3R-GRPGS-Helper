extends Control

var index_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer/VBoxContainer"
var name_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer2/VBoxContainer"
var base_damage_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer3/VBoxContainer"
var base_defense_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer4/VBoxContainer"
var requirements_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer5/VBoxContainer"
var durability_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer6/VBoxContainer"
var rarity_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer7/VBoxContainer"
var ability_line = "Panel/ScrollContainer/HBoxContainer/VBoxContainer8/VBoxContainer"

var f = [index_line, name_line, base_damage_line, base_defense_line, requirements_line, durability_line, rarity_line, ability_line]

var s = true

func _ready():
	if Global.settings["theme"] == "dark":
		$FileDialog.theme = Global.darkTheme
	elif Global.settings["theme"] == "light":
		$FileDialog.theme = Global.lightTheme
	
	$FileDialog.current_dir = "user://sheets/"
	$FileDialog.current_path = "user://sheets/"
	$FileDialog.add_filter("*.sheet")
	if Global.curentSheetPath == null:
		$FileDialog.popup_centered()
	_update_inventory()

func _process(delta):
	if Global.curentSheetPath != null:
		if Global.setings["auto_save"]:
			if s:
				s = false
				$Timer.start(Global.setings["auto_save_frequency"])
			
	if $AcceptDialog.visible:
		if $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit2.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit3.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit4.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit5.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit6.text == "" \
		or $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit7.text == "":
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
	Global.curentSheet["index"].clear()
	for i in Global.curentSheet["names"].size():
		Global.curentSheet["index"].insert(Global.curentSheet["index"].size(), String(Global.curentSheet["index"].size()))

func _update_inventory():
	for i in f:
		_clear_lines(get_node(i))
		pass
	
	if Global.curentSheet != null:
		for i in Global.curentSheet["index"].size():
			var index_label = Label.new()
			var name_label = Label.new()
			var base_damage_label = Label.new()
			var base_defense_label = Label.new()
			var requirements_label = Label.new()
			var durability_label = Label.new()
			var rarity_label = Label.new()
			var ability_label = Label.new()
			var labels = [index_label, name_label, base_damage_label, base_defense_label, requirements_label, durability_label, rarity_label, ability_label]
			index_label.text = Global.curentSheet["index"][i]
			name_label.text = Global.curentSheet["names"][i]
			base_damage_label.text = Global.curentSheet["base_damage"][i]
			base_defense_label.text = Global.curentSheet["base_defense"][i]
			requirements_label.text = Global.curentSheet["requirements"][i]
			durability_label.text = Global.curentSheet["durability"][i]
			rarity_label.text = Global.curentSheet["rarity"][i]
			ability_label.text = Global.curentSheet["ability"][i]
			for l in labels:
				l.align = 1
				l.valign = 1
			get_node(index_line).add_child(index_label, true)
			get_node(name_line).add_child(name_label, true)
			get_node(base_damage_line).add_child(base_damage_label, true)
			get_node(base_defense_line).add_child(base_defense_label, true)
			get_node(requirements_line).add_child(requirements_label, true)
			get_node(durability_line).add_child(durability_label, true)
			get_node(rarity_line).add_child(rarity_label, true)
			get_node(ability_line).add_child(ability_label, true)

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
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit6.text = ""
	$AcceptDialog/ScrollContainer/VBoxContainer/LineEdit7.text = ""
	$AcceptDialog2/VBoxContainer/LineEdit.text = ""
	$AcceptDialog3/VBoxContainer/LineEdit.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit2.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit3.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit4.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit5.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit6.text = ""
	$AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit7.text = ""

func _print_inventory():
	print("Index: " + String(Global.curentSheet["index"]))
	print("Names: " + String(Global.curentSheet["names"]))
	print("Base Damage: " + String(Global.curentSheet["base_damage"]))
	print("Base Defense: " + String(Global.curentSheet["base_defense"]))
	print("Requirements: " + String(Global.curentSheet["requirements"]))
	print("Durability: " + String(Global.curentSheet["durability"]))
	print("Rarity: " + String(Global.curentSheet["rarity"]))
	print("Abilitis: " + String(Global.curentSheet["ability"]))

func _add_itens():
	Global.curentSheet["index"].insert(Global.curentSheet["index"].size(), String(Global.curentSheet["index"].size()))
	Global.curentSheet["names"].insert(Global.curentSheet["names"].size(), $AcceptDialog/ScrollContainer/VBoxContainer/LineEdit.text)
	Global.curentSheet["base_damage"].insert(Global.curentSheet["base_damage"].size(), String(int($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit2.text)))
	Global.curentSheet["base_defense"].insert(Global.curentSheet["base_defense"].size(), String(int($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit3.text)))
	Global.curentSheet["requirements"].insert(Global.curentSheet["requirements"].size(), String($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit4.text))
	Global.curentSheet["durability"].insert(Global.curentSheet["durability"].size(), String(int($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit5.text)))
	Global.curentSheet["rarity"].insert(Global.curentSheet["rarity"].size(), String($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit6.text))
	Global.curentSheet["ability"].insert(Global.curentSheet["ability"].size(), String($AcceptDialog/ScrollContainer/VBoxContainer/LineEdit7.text))
	_clear_edit_line()
	_update_inventory()
	_print_inventory()

func _remove_itens():
	if Global.curentSheet["index"].has(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))):
		Global.curentSheet["names"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["base_damage"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["base_defense"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["requirements"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["durability"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["rarity"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["ability"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		Global.curentSheet["index"].remove(Global.curentSheet["index"].find(String(int($AcceptDialog2/VBoxContainer/LineEdit.text))))
		_update_index()
	else:
		$ErrorPopup.dialog_text = "NON-EXISTING_INDEX"
		$ErrorPopup.popup_centered()
	_clear_edit_line()
	_update_inventory()
	_print_inventory()

func _edit_itens():
	Global.curentSheet["names"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["names"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit.text))
	Global.curentSheet["base_damage"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["base_damage"].insert($AcceptDialog4.selected_index, String(int($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit2.text)))
	Global.curentSheet["base_defense"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["base_defense"].insert($AcceptDialog4.selected_index, String(int($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit3.text)))
	Global.curentSheet["requirements"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["requirements"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit4.text))
	Global.curentSheet["durability"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["durability"].insert($AcceptDialog4.selected_index, String(int($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit5.text)))
	Global.curentSheet["rarity"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["rarity"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit6.text))
	Global.curentSheet["ability"].remove($AcceptDialog4.selected_index)
	Global.curentSheet["ability"].insert($AcceptDialog4.selected_index, String($AcceptDialog4/ScrollContainer/VBoxContainer/LineEdit7.text))
	$AcceptDialog4.selected_index = ""
	_clear_edit_line()
	_update_inventory()
	_print_inventory()

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

func _on_AcceptDialog_confirmed():
	_add_itens()
	pass 

func _on_AcceptDialog2_confirmed():
	_remove_itens()
	pass 

func _on_AcceptDialog3_confirmed():
	$AcceptDialog4.selected_index = String(int($AcceptDialog3/VBoxContainer/LineEdit.text))
	if Global.curentSheet["index"].has($AcceptDialog4.selected_index):
		$AcceptDialog4.popup_centered()
	else:
		$ErrorPopup.dialog_text = "NON-EXISTING_INDEX"
		$ErrorPopup.popup_centered()
	pass 

func _on_AcceptDialog4_confirmed():
	_edit_itens()
	pass 

func _on_TextureButton_button_down():
	get_tree().change_scene("res://Scenes/SheetManager.tscn")
	pass 

func _on_FileDialog_file_selected(path):
	Global.curentSheetPath = path
	var a = SaveSistem.load_data(path)
	for i in Global.curentSheet:
		if i in a:
			Global.curentSheet[i] = a[i]
	_update_inventory()


func _on_Timer_timeout():
	if Global.curentSheetPath != null:
		if Global.setings["auto_save"]:
			if s:
				s = false
				$Timer.start(Global.setings["auto_save_frequency"])
	pass # Replace with function body.
