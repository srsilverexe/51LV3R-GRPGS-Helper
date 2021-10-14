extends Tabs

func _ready():
	$FileDialog.current_dir = "user://sheets/"
	$FileDialog.current_path = "user://sheets/"
	$FileDialog.add_filter("*.sheet")

func _on_TabContainer_tab_selected(tab):
	if tab == 1:
		if Global.curentSheet == null:
			$FileDialog.popup_centered()
			$FileDialog.popup()
	pass 

func _on_FileDialog_file_selected(path):
	Global.curentSheetPath = path
	var a = SaveSistem.load_data(path)
	for i in Global.curentSheet:
		if i in a:
			Global.curentSheet[i] = a[i]
	pass 

# warning-ignore:unused_argument
func _process(delta):
	if Global.curentSheet != null:
		_sync_labels()
		if Global.curentSheetPath != null:
			_sheet_update()
	pass

func _sync_labels():
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label3.text = String(Global.curentSheet["name"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label5.text = String(Global.curentSheet["race"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label7.text = String(Global.curentSheet["class"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/Label3.text = String(Global.curentSheet["level"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/HBoxContainer/Label.text = String(String(Global.curentSheet["life"]) + "/" + String(Global.curentSheet["max_life"]))
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/HBoxContainer2/Label.text = String(String(Global.curentSheet["stamina"]) + "/" + String(Global.curentSheet["max_stamina"]))
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/HBoxContainer3/Label.text = String(String(Global.curentSheet["mana_vital_energy"]) + "/" + String(Global.curentSheet["max_mana_vital_energy"]))
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/HBoxContainer4/Label.text = String(Global.curentSheet["money"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer/Label2.text = String(Global.curentSheet["strength"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer2/Label2.text = String(Global.curentSheet["velocity"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer3/Label2.text = String(Global.curentSheet["intelligence"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer4/Label2.text = String(Global.curentSheet["wisdom"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer5/Label2.text = String(Global.curentSheet["charisma"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer6/Label2.text = String(Global.curentSheet["vitality"])
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/GridContainer/VBoxContainer7/Label2.text = String(Global.curentSheet["sanity"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox.pressed = bool(Global.curentSheet["cold_steel"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox2.pressed = bool(Global.curentSheet["handguns"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox3.pressed = bool(Global.curentSheet["medium_weapons"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox4.pressed = bool(Global.curentSheet["long_weapons"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox5.pressed = bool(Global.curentSheet["heavy_weapons"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox6.pressed = bool(Global.curentSheet["break-ins"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox7.pressed = bool(Global.curentSheet["martial_arts"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox8.pressed = bool(Global.curentSheet["attention_notice"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox9.pressed = bool(Global.curentSheet["fight"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox10.pressed = bool(Global.curentSheet["credibility"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox11.pressed = bool(Global.curentSheet["personal_cares"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox12.pressed = bool(Global.curentSheet["disguise"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox13.pressed = bool(Global.curentSheet["education_general_culture"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox14.pressed = bool(Global.curentSheet["hide_evade"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox15.pressed = bool(Global.curentSheet["dodge_escape"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox16.pressed = bool(Global.curentSheet["falsification"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox17.pressed = bool(Global.curentSheet["stealth"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox18.pressed = bool(Global.curentSheet["questioning"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox19.pressed = bool(Global.curentSheet["intimidation"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox20.pressed = bool(Global.curentSheet["leadership"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox21.pressed = bool(Global.curentSheet["medicines"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox22.pressed = bool(Global.curentSheet["medicine"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox23.pressed = bool(Global.curentSheet["bargain"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox24.pressed = bool(Global.curentSheet["perception"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox25.pressed = bool(Global.curentSheet["labia_persuasion"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox26.pressed = bool(Global.curentSheet["first_aid"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox27.pressed = bool(Global.curentSheet["drug_torture_resistance"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox28.pressed = bool(Global.curentSheet["resistance"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox29.pressed = bool(Global.curentSheet["seduction"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox30.pressed = bool(Global.curentSheet["survival"])
	$HBoxContainer/VBoxContainer/VBoxContainer/GridContainer/CheckBox31.pressed = bool(Global.curentSheet["tracking"])
	

func _sheet_update():
	Global.curentSheet["max_life"] = Global.curentSheet["strength"] * Global.curentSheet["vitality"]
	Global.curentSheet["max_stamina"] = Global.curentSheet["velocity"] * Global.curentSheet["vitality"]
	Global.curentSheet["max_mana_vital_energy"] = Global.curentSheet["wisdom"] * Global.curentSheet["vitality"]
	if Global.curentSheet["life"] == 0:
		Global.curentSheet["life"] = Global.curentSheet["max_life"]
	if Global.curentSheet["stamina"] == 0:
		Global.curentSheet["stamina"] = Global.curentSheet["max_stamina"]
	if Global.curentSheet["mana_vital_energy"] == 0:
		Global.curentSheet["mana_vital_energy"] = Global.curentSheet["max_mana_vital_energy"]
	SaveSistem.save_data(Global.curentSheetPath, Global.curentSheet)

func _clear_popups():
	$AddLifePopup/LineEdit.text = ""
	$AddManaPopup/LineEdit.text = ""
	$AddMoneyPopup/LineEdit.text = ""
	$AddStaminaPopup/LineEdit.text = ""
	$RemoveLifePopup/LineEdit.text = ""
	$RemoveManaPopup/LineEdit.text = ""
	$RemoveMoneyPopup/LineEdit.text = ""
	$RemoveStaminaPopup/LineEdit.text = ""

func _on_ButtonRemoveLife_button_down():
	if Global.curentSheet["life"] > 0:
		var a = $RemoveLifePopup.get_ok()
		a.text = "Remover"
		$RemoveLifePopup.popup_centered()
		$RemoveLifePopup.popup()
	pass 

func _on_ButtonAddLife_button_down():
	if Global.curentSheet["life"] < Global.curentSheet["max_life"]:
		var a = $AddLifePopup.get_ok()
		a.text = "Adicionar"
		$AddLifePopup.popup_centered()
		$AddLifePopup.popup()
	pass 


func _on_ButtonRemoveStamina_button_down():
	if Global.curentSheet["stamina"] > 0:
		var a = $RemoveStaminaPopup.get_ok()
		a.text = "Remover"
		$RemoveStaminaPopup.popup_centered()
		$RemoveStaminaPopup.popup()
	pass 


func _on_ButtonAddStamina_button_down():
	if Global.curentSheet["stamina"] < Global.curentSheet["max_stamina"]:
		var a = $AddStaminaPopup.get_ok()
		a.text = "Adicionar"
		$AddStaminaPopup.popup_centered()
		$AddStaminaPopup.popup()
	pass 


func _on_ButtonRemoveMana_button_down():
	if Global.curentSheet["mana_vital_energy"] > 0:
		var a = $RemoveManaPopup.get_ok()
		a.text = "Remover"
		$RemoveManaPopup.popup_centered()
		$RemoveManaPopup.popup()
	pass 

func _on_ButtonAddMana_button_down():
	if Global.curentSheet["mana_vital_energy"] < Global.curentSheet["max_mana_vital_energy"]:
		var a = $AddManaPopup.get_ok()
		a.text = "Adicionar"
		$AddManaPopup.popup_centered()
		$AddManaPopup.popup()
	pass 

func _on_ButtonRemoveMoney_button_down():
	var a = $RemoveMoneyPopup.get_ok()
	a.text = "Remover"
	$RemoveMoneyPopup.popup_centered()
	$RemoveMoneyPopup.popup()
	pass 

func _on_ButtonAddMoney_button_down():
	var a = $AddMoneyPopup.get_ok()
	a.text = "Adicionar"
	$AddMoneyPopup.popup_centered()
	$AddMoneyPopup.popup()
	pass 

func _on_AddLifePopup_confirmed():
	Global.curentSheet["life"] += int($AddLifePopup/LineEdit.text)
	if Global.curentSheet["life"] > Global.curentSheet["max_life"]:
		Global.curentSheet["life"] = Global.curentSheet["max_life"]
	_clear_popups() 

func _on_RemoveLifePopup_confirmed():
	Global.curentSheet["life"] -= int($RemoveLifePopup/LineEdit.text)
	if Global.curentSheet["life"] < 0:
		Global.curentSheet["life"] = 0
	_clear_popups() 

func _on_AddStaminaPopup_confirmed():
	Global.curentSheet["stamina"] += int($AddStaminaPopup/LineEdit.text)
	if Global.curentSheet["stamina"] > Global.curentSheet["max_stamina"]:
		Global.curentSheet["stamina"] = Global.curentSheet["max_stamina"]
	_clear_popups() 

func _on_RemoveStaminaPopup_confirmed():
	Global.curentSheet["stamina"] -= int($RemoveStaminaPopup/LineEdit.text)
	if Global.curentSheet["stamina"] < 0:
		Global.curentSheet["stamina"] = 0
	_clear_popups() 

func _on_AddManaPopup_confirmed():
	Global.curentSheet["mana_vital_energy"] += int($AddManaPopup/LineEdit.text)
	if Global.curentSheet["mana_vital_energy"] > Global.curentSheet["max_vmana_vital_energy"]:
		Global.curentSheet["mana_vital_energy"] = Global.curentSheet["max_mana_vital_energy"]
	_clear_popups() # Replace with function body.


func _on_RemoveManaPopup_confirmed():
	Global.curentSheet["mana_vital_energy"] -= int($RemoveManaPopup/LineEdit.text)
	if Global.curentSheet["mana_vital_energy"] < 0:
		Global.curentSheet["mana_vital_energy"] = 0
	_clear_popups() # Replace with function body.


func _on_AddMoneyPopup_confirmed():
	Global.curentSheet["money"] += int($AddMoneyPopup/LineEdit.text)
	_clear_popups() # Replace with function body.


func _on_RemoveMoneyPopup_confirmed():
	Global.curentSheet["money"] -= int($RemoveMoneyPopup/LineEdit.text)
	_clear_popups() # Replace with function body.


func _on_Button_button_down():
	$FileDialog.popup_centered()
	$FileDialog.popup()
	pass # Replace with function body.
