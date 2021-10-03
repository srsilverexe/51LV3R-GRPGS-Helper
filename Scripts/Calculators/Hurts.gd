extends Tabs

var v = 0 #vitality
var f = 0 #strength
var c = 0 #head
var t = 0 #body
var b = 0 #arm
var p = 0 #leg

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
