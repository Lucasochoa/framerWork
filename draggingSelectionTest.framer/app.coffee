
joshLabel = new Layer
  x:156, y:105, width:156, height:156, backgroundColor: "black"

  
dropTargetRight = new Layer
  x:333, y:105, width:156, height:156, backgroundColor: "teal"
dropTargetRight.html = "left"

dropTargetLeft = new Layer y:105, width:156, height:156, backgroundColor: "teal"
dropTargetLeft.html = "left"


joshLabel.draggable.enabled = true
joshLabel.draggable.vertical = false
initX = joshLabel.x
initY = joshLabel.y
joshLabel.draggable.speedX = 0.7
joshLabel.onForceTap ->
	print "meow"



joshLabel.on Events.DragEnd, ->
	joshLabel.animate 
		properties:
			x: initX,
			y: initY
			curve: "spring(300,18,10)"



joshLabel.on Events.DragMove, ->
	triggerDirection(dropTargetLeft)
	triggerDirection(dropTargetRight)

triggerDirection = (trigger) ->
	dX = Math.abs(trigger.midX - joshLabel.midX)
	dY = Math.abs(trigger.midY - joshLabel.midY)
	if dX < 20 && dY < 20
		trigger.backgroundColor = "green"
	else
		trigger.backgroundColor = "teal"