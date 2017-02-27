layerA = new Layer
	width: 1242
	height: 1370
		
# For Events.Swipe 
layerA.onSwipe ->
	Utils.delay 1, ->
		print "Currently swiping"
# For Events.SwipeStart 
layerA.onSwipeStart ->
    print "Start swiping"
 
# For Events.SwipeEnd 
layerA.onSwipeEnd ->
    print "End swiping"