extends Tabs

var v = 0 #vitalidade
var f = 0 #força
var a = 0 #agilidade
var s = 0 #sabedoria

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	v = float($VBoxContainer/LineEdit.text)
	f = float($VBoxContainer/LineEdit.text)
	a = float($VBoxContainer/LineEdit.text)
	s = float($VBoxContainer/LineEdit.text)
	
	var vida = f * v
	var stamina = a * v
	var mana = s * v
	
	$VBoxContainer2/Label3.text = String(vida)
	$VBoxContainer2/Label5.text = String(stamina)
	$VBoxContainer2/Label7.text = String(mana)
	
	pass
