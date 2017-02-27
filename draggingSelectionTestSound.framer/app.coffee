# # Simulated vibration in Framer
# # Ryhan Hassan
# # ryhan@dropbox.com
# 
# ############################################
# # Web Audio
# ############################################
# 
# audio_context = new webkitAudioContext()
# source = audio_context.createOscillator()
# 
# # 0 - Sine wave
# # 1 - Square wave
# # 2 - Sawtooth wave
# # 3 - Triangle wave
# source.type = 0
# 
# source.frequency.value = 0
# 
# compressor = audio_context.createDynamicsCompressor()
# 
# compressor.threshold.value = -40;
# compressor.knee.value = 30;
# compressor.ratio.value = -5;
# compressor.reduction.value = -20;
# compressor.attack.value = 0;
# compressor.release.value = 0.2;
# 
# 
# volume = audio_context.createGainNode()
#  
# # connect source through a series of filters
# source.connect compressor
# compressor.connect volume
# volume.connect audio_context.destination
# 
# source.noteOn(0)
# 
# sound_min = 200
# sound_step = 30
# sound_step_count = 20
# sound_spacing = 0.02
# 
# volume.gain.value = 1
# nextNote = (i) ->
# 	if (i < 20)
# 		source.frequency.value = sound_min + sound_step*i
# 		volume.gain.value = (sound_step_count - i)/sound_step_count
# 		
# 	else
# 		source.frequency.value = 0
# 
# playSound = () ->
# 	nextNote(0)
# 	[0, sound_step_count+1].map (i) ->
# 		Utils.delay i*sound_spacing, -> nextNote i
# 	Utils.delay 0.6, -> 
# 		volume.gain.value = 0
# 		source.frequency.value = 0
screenTemplate = new Layer
	width: 750
	height: 1334

inputRest = new Layer
  midX:screenTemplate.width/2, y:105, width:156, height:156, backgroundColor: "rgba(0,253,255,1)"
  
dropTargetRight = new Layer width:screenTemplate.width/4, height:screenTemplate.height, backgroundColor: "teal", x:screenTemplate.width - screenTemplate.width/4
dropTargetRight.html = "left"

dropTargetLeft = new Layer y:0, width:screenTemplate.width/4, height:screenTemplate.height, backgroundColor: "teal"
dropTargetLeft.html = "left"


inputRest.draggable.enabled = true
inputRest.draggable.vertical = false
initX = inputRest.x
initY = inputRest.y
inputRest.draggable.speedX = 1
inputRest.draggable.constraints =
    width: 750
    height: 200
inputRest.draggable.overdrag = false
inputRest.onForceTap ->
	playSound()
	
#animation
inputRest.on Events.DragEnd, ->
	inputRest.animate 
		properties:
			x: initX,
			y: initY
			curve: "spring(300,18,10)"

inputRest.on Events.DragMove, ->
	triggerDirection(dropTargetLeft)
	triggerDirection(dropTargetRight)
inputRest.on Events.DragEnd, ->
	Utils.delay .5, ->
		triggerDirection(dropTargetLeft)
		triggerDirection(dropTargetRight)

triggerDirection = (trigger,direction) ->
	dX = Math.abs(trigger.midX - inputRest.midX)
	dY = Math.abs(trigger.midY - inputRest.midY)
	if dX < 100 && dY < 500
		trigger.backgroundColor = "green"
	else
		trigger.backgroundColor = "teal"