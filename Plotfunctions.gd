extends Node2D
# All variables declared are to be computed from other scripts and imported for plotting
var Tank
var Water

# this is the function that draws everything
func _draw():
	# Drawing Tank
	plot(Tank.Xt1, Tank.Yt1, Color.black, 3)
	plot(Tank.Xt2, Tank.Yt2, Color.black, 3)
	# Drawing Water
	fill(Water.Xw, Water.Yw, Color.blue, 0.7)


#this is called to update whatever the _draw function has drawn previously
# with any new data changes
func plotupdate():
	update()
	
# this function plots lines given a vector
# the v vector here is the output of the _scale function with the X and Y 
#  arrays describing the line
func plot(X, Y, color, thickness):
	if X == null:
		return
	# Plotting function
	var v = PoolVector2Array()
	for i in range(len(X)):
		v.append(scale(X[i], Y[i]))
	if len(v)>=2:
		draw_polyline(v, color, thickness)
	
# this is used to convert from nominal decimal units to the user's desired screen size
func scale(x, y):
	# Scaling
	return Vector2(250 * (x + 1), 450 - 250 * y)

func fill(X, Y, color, alpha):
	if X == null:
		return
	# fills a color polygon
	var lightcolor = color.lightened(alpha)
	var v = PoolVector2Array()
	for i in range(len(X)):
		v.append(scale(X[i], Y[i]))
	if len(v)>3:
		draw_colored_polygon(v, lightcolor)
