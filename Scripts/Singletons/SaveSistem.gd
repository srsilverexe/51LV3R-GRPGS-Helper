extends Node 

func save_data(path:String, dat:Dictionary):
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(dat)
	f.close()

func load_data(path:String)->Dictionary:
	var f = File.new()
	if f.file_exists(path):
		var dat:Dictionary = {}
		if f.open(path, File.READ) == OK:
			dat = f.get_var()
		f.close()
		return dat
	else:
		return {}
