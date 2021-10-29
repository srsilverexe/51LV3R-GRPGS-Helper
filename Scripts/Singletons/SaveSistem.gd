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

func log_saver(path:String, info:String):
	var f = File.new()
	var log_line = String(_time_formater()) + " --- " + info 
	if f.file_exists(path):
		f.open(path, File.READ_WRITE)
		f.seek_end()
		f.store_line(log_line)
		f.close()
	else:
		f.open(path, File.WRITE)
		f.store_line(log_line)
		f.close()

func scan_folder(path:String = ""):
	var f = Directory.new()
	var list = []
	
	
	f.open(path)
	
	f.list_dir_begin(true)
	var l = f.get_next()
	if l != "":
		while l != "":
			list.insert(list.size(), l)
			l = f.get_next()
	else:
		printerr("no archives in folder")
	
	return list


func _time_formater():
	var t = OS.get_datetime()
	var ft = ""
	
	ft = String(t["day"]) + "/" + String(t["month"]) + "/" + String(t["year"]) + " " + String(t["hour"]) + ":" + String(t["minute"]) + ":" + String(t["second"])
	
	return ft
