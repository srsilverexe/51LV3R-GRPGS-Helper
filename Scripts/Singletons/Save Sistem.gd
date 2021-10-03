extends Node 

func save_data(caminho:String, dat:Dictionary):
	var f = File.new()
	f.open(caminho, File.WRITE)
	f.store_var(dat)
	f.close()

func load_data(caminho:String)->Dictionary:
	var f = File.new()
	var dat:Dictionary = {}
	if f.open(caminho, File.READ) == OK:
		dat = f.get_var()
	f.close()
	return dat
