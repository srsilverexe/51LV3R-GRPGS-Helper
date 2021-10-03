extends Tabs

var v = 0 #vitalidade
var f = 0 #força
var c = 0 #cabeça
var t = 0 #tronco
var b = 0 #braço
var p = 0 #perna

func _process(delta):
	v = float($VBoxContainer/LineEdit.text)
	f = float($VBoxContainer/LineEdit2.text)
	
	c = int((f * v) / 7)
	t = int((f * v) / 5)
	b = int((f * v) / 9)
	p = int((f * v) / 9)
	
	$VBoxContainer2/Label3.text = String(c)
	$VBoxContainer2/Label5.text = String(t)
	$VBoxContainer2/Label7.text = String(b)
	$VBoxContainer2/Label9.text = String(p)
