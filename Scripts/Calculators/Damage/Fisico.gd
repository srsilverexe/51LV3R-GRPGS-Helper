extends Tabs

var bonus = false
var onus = false

var a = 0 #dano da arma
var f = 0 #força do personagem
var d = 0 #numero do dado
var b = 0 #bonus
var o = 0 #onus
var x = 0 #dano

func _process(delta):
	a = float($VBoxContainer/LineEdit.text)
	f = float($VBoxContainer/LineEdit2.text)
	d = float($VBoxContainer/LineEdit3.text)
	
	x = int(a + (f/4) * (d/4))
	
	b = float($VBoxContainer/LineEdit4.text)
	o = float($VBoxContainer/LineEdit5.text)
	
	if bonus:
		x += b
	
	if onus:
		x -= o
	
	$VBoxContainer/Label5.text = String(x)

func _on_CheckButton_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/LineEdit4.editable = true
		bonus = true
	else:
		$VBoxContainer/LineEdit4.editable = false
		bonus = false
	pass

func _on_CheckButton2_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/LineEdit5.editable = true
		onus = true
	else:
		$VBoxContainer/LineEdit5.editable = false
		onus = false
	pass
