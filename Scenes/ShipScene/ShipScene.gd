extends Node2D

export var valor_inicial = 75

var status = {"populacao":valor_inicial,"humor":valor_inicial,"escudo":valor_inicial,"energia":valor_inicial}

var dia = 0
var objetivo = 10


func _ready():
	
	#Atualiza status
	for s in status.keys():
		$Stats.get_node(s.capitalize()).value = status[s]
	
	# faz coisa
	novo_dia()

	
	pass

func novo_dia():
	dia += 1
	var acontecimento = "nada" 
	#Se for o primeiro dia, nao acontece nada
	
	if acontecimento == "nada":
		$Monitor/Texto.mostrar("Geronimo " + str(dia))
	get_tree().create_timer(5).connect("timeout",self,"fim_dia",[{"populacao":0,"humor":0,"escudo":0,"energia":0}])
	
	#Acontecimento aleatorio, (desafio, escolha, nada)
	#acontece nada
	#Update_monitor
	
	#Se tiver desafio ou escolha:
	#	Coloca o minijogo no monitor
	#	Revela o minijogo
	
	
	pass
	
func fim_dia(somar_stats: Dictionary):
	
	
	#Avaliaçcao dos status
	for s in status.keys():
		status[s] += somar_stats[s]
		if status[s] > 100:
			status[s] = 100
		$Stats.get_node(s.capitalize()).value = status[s]
		if status[s] <= 0:
			yield(get_tree().create_timer(1),"timeout")
			get_tree().quit()
			return
	
	if dia >= objetivo:
		print("TETRA")
		yield(get_tree().create_timer(1),"timeout")
		get_tree().quit()
		return
	novo_dia()
	
	pass 