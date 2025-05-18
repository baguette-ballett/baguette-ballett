extends Node

var d1LiveLeft = 100
var d2LiveLeft = 100
var d3LiveLeft = 100

var baguettes = []
var player
var game_won = false

var playerOverPond = false

func getBaguettesInRange():
	return baguettes.filter(func(baguette): return baguette and baguette.isInRange)


func setPlayrOverPond(value) ->void:
	playerOverPond = value
