extends Tabs

var bonus = false
var onus = false

var e = 0 #dano especial
var s = 0 #sabedoria do personagem
var d = 0 #numero do dado
var b = 0 #bonus
var o = 0 #onus
var x = 0 #dano

# warning-ignore:unused_argument
func _process(delta):
	e = float($VBoxContainer/LineEdit.text)
	s = float($VBoxContainer/LineEdit2.text)
	d = float($VBoxContainer/LineEdit3.text)
	
	x = int(e * (s/8) * (d/8))
	
	b = float($VBoxContainer/LineEdit4.text)
	o = float($VBoxContainer/LineEdit5.text)
	
	if bonus:
		x += b
	
	if onus:
		x -= o
	
	$VBoxContainer/Label5.text = String(x)
	pass

func _on_CheckButton_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/LineEdit4.editable = true
		bonus = true
	else:
		$VBoxContainer/LineEdit4.editable = false
		bonus = false
	pass # Replace with function body.

func _on_CheckButton2_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/LineEdit5.editable = true
		onus = true
	else:
		$VBoxContainer/LineEdit5.editable = false
		onus = false
	pass # Replace with function body.
