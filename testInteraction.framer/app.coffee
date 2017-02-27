layerA = new Layer

# For Events.Tap 
layerA.onTap ->
    print "Tap"
    
# For Events.DoubleTap 
layerA.onDoubleTap ->
    print "Double tap"

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