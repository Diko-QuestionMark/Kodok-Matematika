extends Node

const save_location = "user://SaveFile.json"

var contents_to_save = {
	"jumlah_berhasil": 0,
	"jumlah_gagal": 0
}

func _save():
	contents_to_save.jumlah_berhasil = Global.jumlah_berhasil
	contents_to_save.jumlah_gagal = Global.jumlah_gagal
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(contents_to_save.duplicate())
	file.close()


func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var save_data =data.duplicate()
		contents_to_save.jumlah_berhasil = save_data.jumlah_berhasil
		contents_to_save.jumlah_gagal = save_data.jumlah_gagal
		
		Global.jumlah_berhasil = save_data.jumlah_berhasil
		Global.jumlah_gagal = save_data.jumlah_gagal
