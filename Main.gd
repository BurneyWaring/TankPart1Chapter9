#From the Book:
#Create Compelling Science and Engineering Simulations Using the Godot Engine, Copyright 2024 Burney Waring, ThankGod Egbe, Lateef Kareem 
#Chapter 9

extends Node2D


onready var Tank = get_node("Tank")
onready var Plotfunc = get_node("Plotfunctions")
onready var Water = get_node("Water")

func _ready():
	Plotfunc.Tank = Tank
	Plotfunc.Water = Water

func _process(delta):
	#all the data is ready to be plotted, 
	# so call Plotfunctions to do the drawing
	Plotfunc.plotupdate()
	Water.waterdata()  

