#author Sergiy Voronov
# twitter.com/mamezito

# Import file "thermo" (sizes and positions are scaled 1:3)
#sketch = Framer.Importer.load("imported/thermo@3x")
dragOnCircle = require "dragOnCircle"

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


months = new Layer
	x: 20  
	y: 350
	width:200
	height:200
	backgroundColor: null
	html: "feb"
	style:
		fontWeight: 300
		fontSize: "4rem"
	
year = new Layer
	x: 180 +80
	y: 350
	width: 200
	height: 200
	backgroundColor: null
	html: "0000"
	style:
		fontWeight: 300
		fontSize: "4rem"
		
days = new Layer
	x: 150  
	y: 350
	width:200
	height:200
	backgroundColor: null
	html: "31"
	style:
		fontWeight: 300
		fontSize: "4rem"
		
seconds = new Layer
	x: 363 + 43 +200
	y: 350
	width: 200
	height: 200
	backgroundColor: null
	html: "00"
	style:
		fontWeight: 300
		fontSize: "4rem"

minutes = new Layer
	x:200 + 43 + 200
	y: 350
	width: 200
	height: 200
	backgroundColor: null
	html: "00"
	style:
		fontWeight: 300
		fontSize: "4rem"

#formatting
colon = new Layer
	x: 310 + 43 + 200
	y: 350
	width: 200
	height: 200
	backgroundColor: null
	html: ":"
	style:
		fontWeight: 300
		fontSize: "4rem"	
		
divider = new Layer
	x: 310+105
	y: 350
	backgroundColor: null
	html: "|"
	style:
		fontWeight: 300
		fontSize: "4rem"	
comma = new Layer
	x: 220
	y: 350
	backgroundColor: null
	html: ","
	style:
		fontWeight: 300
		fontSize: "4rem"	


Knob = new Layer
	width: 110
	height: 110
	y: 626
	backgroundColor: "#fff"
	borderRadius: 110
	shadowBlur: 10
	shadowSpread: 5
	shadowColor: "rgba(0,0,0,0.2)"
	html:"18"

Knob.centerX()
Knob.style=
	"line-height":"110px"	
	"width":"110px"
	"text-align":"center"
	"font-size":"39px"
	"color":"#ADAAAA"
	"font-family":"Roboto"
	
layerA = new Layer
 width: 110
 height:110
 midX:Knob.midX
 midY:Knob.midY
 visible: false

changeElement = () ->
	secondsCount = Math.floor(Utils.modulate(dragOnCircle.dragAngle, [360, 180], [0, 59],true))
	if secondsCount < 10
		secondsCount = "0" + secondsCount
	seconds.html = secondsCount
	
	if dragOnCircle.dragAngle < 30 && dragOnCircle.dragAngle  > 0
		seconds.html = "00"
	
# function call with parameteres layer -Knob and radius - 280px

layerB = new Layer
layerB.onClick ->
	print(dragOnCircle.myVar)

angle = dragOnCircle.circleDrag Knob, 280

Knob.on "change:x", ->
# dragOnCircle.dragAngle is angle of current rotation
	if dragOnCircle.dragAngle>180
		Knob.html=Math.floor(Utils.modulate(dragOnCircle.dragAngle, [180, 360], [0, 18],true))
	else
		Knob.html=Math.floor(Utils.modulate(dragOnCircle.dragAngle, [0, 180], [18, 36],true))
		
		
#work faster
	if dragOnCircle.myVar == 0
		print(Math.floor(Utils.modulate(dragOnCircle.dragAngle, [0, 359], [0, 60],true)))
		minutes.html = Math.floor(Utils.modulate(dragOnCircle.dragAngle, [0, 359], [0, 60],true))
		
	#else if dragOnCircle.myVar == 1
		
# 	switch dragOnCircle.myVar
# 		when 0 then print(Math.floor(Utils.modulate(dragOnCircle.dragAngle, [360, 180], [0, 59],true)))
# 		when 1 then print("from task 2")
	