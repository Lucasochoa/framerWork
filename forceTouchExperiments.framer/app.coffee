base = new Layer
	width: screen.width
	height: screen.height
layerA = new Layer
	x: 550
	y: 224
left = new Layer
	y: 224
	
# For Events.ForceTap 
layerA.onForceTap ->
    print "Force tap"
 
# For Events.ForceTapChange 
layerA.onForceTapChange ->
    print "Change of force tap pressure"
 
# For Events.ForceTapStart 
layerA.onForceTapStart ->
    print "Start force tap"
 
# For Events.ForceTapEnd 
layerA.onForceTapEnd ->
    print "End force tap"