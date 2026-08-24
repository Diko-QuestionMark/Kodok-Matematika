extends Node

var jawaban_benar
var jawaban_salah

func _ready() -> void:
	generate_soal()


func generate_soal():
	var angka1 = randi_range(1, 99)
	var angka2 = randi_range(1, 99)
	
	jawaban_benar = angka1 + angka2
	
	var opsi = [jawaban_benar]
	while opsi.size() < 4:
		jawaban_salah = jawaban_benar + randi_range(-40, 40)
		if jawaban_salah not in opsi:
			opsi.append(jawaban_salah)
	opsi.shuffle()
	
	print("Soal: ", angka1, " + ", angka2, " = ?")
	print("A. ", opsi[0])
	print("B. ", opsi[1])
	print("C. ", opsi[2])
	print("D. ", opsi[3])
	print("Jawaban benar: ", jawaban_benar)
