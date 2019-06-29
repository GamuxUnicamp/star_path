extends Node2D

signal ENTER

export var valor_inicial = 75

var status = {"populacao":valor_inicial,"humor":valor_inicial,"escudo":valor_inicial,"energia":valor_inicial}

var dia = 0
var objetivo = 10



var modelo_relatorio = {
	"nada": "Nada importante aconteceu hoje.",
	"desafio": "Alerta! Emergencia detectada!",
	"escolha": "Uma escolha dificil apareceu."
	
}


func _ready():
	
	#Atualiza status
	for s in status.keys():
		$Stats.get_node(s.capitalize()).value = status[s]
	
	#set_input true
	set_process_input(true)
	
	
	#Comeca o jogo
	novo_dia()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("ENTER")

func novo_dia():
	dia += 1
	
	#Acontecimento aleatorio, (desafio, escolha, nada)
	#Se for o primeiro dia, nao acontece nada
	
	var acontecimento = acontecimento_aleatorio() 
	
	#Update_monitor
	$Monitor/Texto.mostrar("Dia " + str(dia) +"\n\n"+ modelo_relatorio[acontecimento]+ "\n\n\n\n\n\n\n" + "ENTER")
	
	
	if acontecimento == "nada":
		yield(self, "ENTER")
		get_tree().create_timer(.5).connect("timeout",self,"fim_dia",[{"populacao":0,"humor":0,"escudo":0,"energia":0}])
	
	elif acontecimento == "desafio":
		yield(self, "ENTER")
		get_tree().create_timer(.5).connect("timeout",self,"fim_dia",[{"populacao":0,"humor":0,"escudo":0,"energia":0}])
		print("Heyo")
	
	
	
	#Se tiver desafio ou escolha:
	#	Coloca o minijogo no monitor
	#	Revela o minijogo
	
	
	pass

func acontecimento_aleatorio():
	
	#"nada", "escolha", "desafio"
	
	if dia == 1:
		return "nada"
	
	else:
		randomize()
		
		#(random) [1 - 3]
		var rand = randi()% 2 +1
		
		if rand == 1:
			return "nada"
		
		if rand == 2:
			return "desafio"
	 

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