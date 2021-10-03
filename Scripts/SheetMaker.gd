extends Control

var temp_sheet = {
	#base
	"name": "Joe Doe",
	"level": 1,
	"forca": 0,
	"velocidade": 0,
	"inteligencia": 0,
	"sabedoria": 0,
	"carisma": 0,
	"vitalidade": 0,
	"sanidade": 0,
	#Pericias
	"armas_brancas": true,
	"armas_curtas": true,
	"armas_medias": true,
	"armas_longas": true,
	"armas_pesadas": true,
	"arrombamentos": true,
	"artes_marciais": true,
	"atecao_notar": true,
	"briga": true,
	"credibilidade": true,
	"cuidados_pessoais": true,
	"disfarce": true,
	"educação_e_cultura_geral": true,
	"esconder_evadir": true,
	"esquivar_escapar": true,
	"falsificação": true,
	"furtividade": true,
	"interrogatório": true,
	"intimidação": true,
	"liderança": true,
	"medicamentos": true,
	"medicina": true,
	"negociar": true,
	"percepção": true,
	"persuasão_e_labia": true,
	"primeiros_socorros": true,
	"resistencia_tortura_drogas": true,
	"resistencia": true,
	"seducao": true,
	"sobrevivencia": true,
	"rastreamento": true
}

func _ready():
	$FileDialog.add_filter("*.sheet")
	pass

func _sync_vars():
	temp_sheet["name"] = String($Panel/HBoxContainer/VBoxContainer/LineEdit.text)
	temp_sheet["level"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit9.text)
	temp_sheet["forca"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit2.text)
	temp_sheet["velocidade"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit3.text)
	temp_sheet["inteligencia"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit4.text)
	temp_sheet["sabedoria"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit5.text)
	temp_sheet["carisma"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit6.text)
	temp_sheet["vitalidade"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit7.text)
	temp_sheet["sanidade"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit8.text)
	temp_sheet["armas_brancas"] = bool($Panel/HBoxContainer/GridContainer/CheckBox.pressed)
	temp_sheet["armas_curtas"] = bool($Panel/HBoxContainer/GridContainer/CheckBox2.pressed)
	temp_sheet["armas_medias"] = bool($Panel/HBoxContainer/GridContainer/CheckBox3.pressed)
	temp_sheet["armas_longas"] = bool($Panel/HBoxContainer/GridContainer/CheckBox4.pressed)
	temp_sheet["armas_pesadas"] = bool($Panel/HBoxContainer/GridContainer/CheckBox5.pressed)
	temp_sheet["arrombamentos"] = bool($Panel/HBoxContainer/GridContainer/CheckBox6.pressed)
	temp_sheet["artes_marciais"] = bool($Panel/HBoxContainer/GridContainer/CheckBox7.pressed)
	temp_sheet["atecao_notar"] = bool($Panel/HBoxContainer/GridContainer/CheckBox8.pressed)
	temp_sheet["briga"] = bool($Panel/HBoxContainer/GridContainer/CheckBox9.pressed)
	temp_sheet["credibilidade"] = bool($Panel/HBoxContainer/GridContainer/CheckBox10.pressed)
	temp_sheet["cuidados_pessoais"] = bool($Panel/HBoxContainer/GridContainer/CheckBox11.pressed)
	temp_sheet["disfarce"] = bool($Panel/HBoxContainer/GridContainer/CheckBox12.pressed)
	temp_sheet["educação_e_cultura_geral"] = bool($Panel/HBoxContainer/GridContainer/CheckBox13.pressed)
	temp_sheet["esconder_evadir"] = bool($Panel/HBoxContainer/GridContainer/CheckBox14.pressed)
	temp_sheet["esquivar_escapar"] = bool($Panel/HBoxContainer/GridContainer/CheckBox15.pressed)
	temp_sheet["falsificação"] = bool($Panel/HBoxContainer/GridContainer/CheckBox16.pressed)
	temp_sheet["furtividade"] = bool($Panel/HBoxContainer/GridContainer/CheckBox17.pressed)
	temp_sheet["interrogatório"] = bool($Panel/HBoxContainer/GridContainer/CheckBox18.pressed)
	temp_sheet["intimidação"] = bool($Panel/HBoxContainer/GridContainer/CheckBox19.pressed)
	temp_sheet["liderança"] = bool($Panel/HBoxContainer/GridContainer/CheckBox20.pressed)
	temp_sheet["medicamentos"] = bool($Panel/HBoxContainer/GridContainer/CheckBox21.pressed)
	temp_sheet["medicina"] = bool($Panel/HBoxContainer/GridContainer/CheckBox22.pressed)
	temp_sheet["negociar"] = bool($Panel/HBoxContainer/GridContainer/CheckBox23.pressed)
	temp_sheet["percepção"] = bool($Panel/HBoxContainer/GridContainer/CheckBox24.pressed)
	temp_sheet["persuasão_e_labia"] = bool($Panel/HBoxContainer/GridContainer/CheckBox25.pressed)
	temp_sheet["primeiros_socorros"] = bool($Panel/HBoxContainer/GridContainer/CheckBox26.pressed)
	temp_sheet["resistencia_tortura_drogas"] = bool($Panel/HBoxContainer/GridContainer/CheckBox27.pressed)
	temp_sheet["resistencia"] = bool($Panel/HBoxContainer/GridContainer/CheckBox28.pressed)
	temp_sheet["seducao"] = bool($Panel/HBoxContainer/GridContainer/CheckBox29.pressed)
	temp_sheet["sobrevivencia"] = bool($Panel/HBoxContainer/GridContainer/CheckBox30.pressed)
	temp_sheet["rastreamento"] = bool($Panel/HBoxContainer/GridContainer/CheckBox31.pressed)

func _sync_lines():
	$Panel/HBoxContainer/VBoxContainer/LineEdit.text = String(temp_sheet["name"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit9.text = String(temp_sheet["level"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit2.text = String(temp_sheet["forca"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit3.text = String(temp_sheet["velocidade"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit4.text = String(temp_sheet["inteligencia"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit5.text = String(temp_sheet["sabedoria"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit6.text = String(temp_sheet["carisma"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit7.text = String(temp_sheet["vitalidade"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit8.text = String(temp_sheet["sanidade"])
	$Panel/HBoxContainer/GridContainer/CheckBox.pressed = bool(temp_sheet["armas_brancas"])
	$Panel/HBoxContainer/GridContainer/CheckBox2.pressed = bool(temp_sheet["armas_curtas"])
	$Panel/HBoxContainer/GridContainer/CheckBox3.pressed = bool(temp_sheet["armas_medias"])
	$Panel/HBoxContainer/GridContainer/CheckBox4.pressed = bool(temp_sheet["armas_longas"])
	$Panel/HBoxContainer/GridContainer/CheckBox5.pressed = bool(temp_sheet["armas_pesadas"])
	$Panel/HBoxContainer/GridContainer/CheckBox6.pressed = bool(temp_sheet["arrombamentos"])
	$Panel/HBoxContainer/GridContainer/CheckBox7.pressed = bool(temp_sheet["artes_marciais"])
	$Panel/HBoxContainer/GridContainer/CheckBox8.pressed = bool(temp_sheet["atecao_notar"])
	$Panel/HBoxContainer/GridContainer/CheckBox9.pressed = bool(temp_sheet["briga"])
	$Panel/HBoxContainer/GridContainer/CheckBox10.pressed = bool(temp_sheet["credibilidade"])
	$Panel/HBoxContainer/GridContainer/CheckBox11.pressed = bool(temp_sheet["cuidados_pessoais"])
	$Panel/HBoxContainer/GridContainer/CheckBox12.pressed = bool(temp_sheet["disfarce"])
	$Panel/HBoxContainer/GridContainer/CheckBox13.pressed = bool(temp_sheet["educação_e_cultura_geral"])
	$Panel/HBoxContainer/GridContainer/CheckBox14.pressed = bool(temp_sheet["esconder_evadir"])
	$Panel/HBoxContainer/GridContainer/CheckBox15.pressed = bool(temp_sheet["esquivar_escapar"])
	$Panel/HBoxContainer/GridContainer/CheckBox16.pressed = bool(temp_sheet["falsificação"])
	$Panel/HBoxContainer/GridContainer/CheckBox17.pressed = bool(temp_sheet["furtividade"])
	$Panel/HBoxContainer/GridContainer/CheckBox18.pressed = bool(temp_sheet["interrogatório"])
	$Panel/HBoxContainer/GridContainer/CheckBox19.pressed = bool(temp_sheet["intimidação"])
	$Panel/HBoxContainer/GridContainer/CheckBox20.pressed = bool(temp_sheet["liderança"])
	$Panel/HBoxContainer/GridContainer/CheckBox21.pressed = bool(temp_sheet["medicamentos"])
	$Panel/HBoxContainer/GridContainer/CheckBox22.pressed = bool(temp_sheet["medicina"])
	$Panel/HBoxContainer/GridContainer/CheckBox23.pressed = bool(temp_sheet["negociar"])
	$Panel/HBoxContainer/GridContainer/CheckBox24.pressed = bool(temp_sheet["percepção"])
	$Panel/HBoxContainer/GridContainer/CheckBox25.pressed = bool(temp_sheet["persuasão_e_labia"])
	$Panel/HBoxContainer/GridContainer/CheckBox26.pressed = bool(temp_sheet["primeiros_socorros"])
	$Panel/HBoxContainer/GridContainer/CheckBox27.pressed = bool(temp_sheet["resistencia_tortura_drogas"])
	$Panel/HBoxContainer/GridContainer/CheckBox28.pressed = bool(temp_sheet["resistencia"])
	$Panel/HBoxContainer/GridContainer/CheckBox29.pressed = bool(temp_sheet["seducao"])
	$Panel/HBoxContainer/GridContainer/CheckBox30.pressed = bool(temp_sheet["sobrevivencia"])
	$Panel/HBoxContainer/GridContainer/CheckBox31.pressed = bool(temp_sheet["rastreamento"])

func _on_Button_button_down():
	_sync_vars()
	SaveSistem.save_data("user://" + temp_sheet["name"] + ".sheet", temp_sheet)
	pass # Replace with function body.


func _on_Button2_button_down():
	$FileDialog.popup_centered()
	$FileDialog.popup()
	
	pass # Replace with function body.


# warning-ignore:shadowed_variable
func _on_FileDialog_file_selected(path):
	temp_sheet = SaveSistem.load_data(path)
	_sync_lines()
	pass # Replace with function body.

func _on_TextureButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
