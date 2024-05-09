extends Node2D

var Water_Level
var density
var gravity
var floorheight # floor height
var v_out # Velocity of water fall
var Xw # Combined X coordinates of water fall
var Yw # Combined X coordinates of water fall


# Called when the node enters the scene tree for the first time.
func _ready():
	Water_Level = 0.7
	density = 1000 # Replace with function body.
	gravity = 9.8
	floorheight = -0.505

func waterdata():
	var delta = 1.0/60.0 #the approximate time of a frame
	var h = Water_Level
	var dt = delta
	
	v_out = sqrt(2*gravity*(h - 0.08))
	
	h = max(0.08, h - 0.02*v_out*dt)
	Water_Level = h

	var hp = min(0.12, h) # Depth of water in the orifice
	
	Xw = [0,0,1,1,1.1, 1.1,1, 1]
	Yw = [h,0,0,0.08,0.08, hp, hp, h]
