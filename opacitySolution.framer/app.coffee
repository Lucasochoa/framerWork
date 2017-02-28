# Import file "numberImages" (sizes and positions are scaled 1:2)
sketch3 = Framer.Importer.load("imported/numberImages@2x")
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

images = [sketch3.$2012, sketch3.$2013, sketch3.$2014, sketch3.$2015, sketch3.$2016, sketch3.$2017, sketch3.$2018, sketch3.$2019, sketch3.$2020]

months = [sketch3.jan, sketch3.feb, sketch3.mar, sketch3.apr, sketch3.may, sketch3.jun, sketch3.jul,sketch3.aug, sketch3.sep, sketch3.oct, sketch3.nov, sketch3.dec]

days = [sketch3.$1, sketch3.$2,sketch3.$3,sketch3.$4, sketch3.$5,sketch3.$6,sketch3.$7, sketch3.$8,sketch3.$9,sketch3.$10, sketch3.$11,sketch3.$12,sketch3.$13, sketch3.$14,sketch3.$15,sketch3.$16, sketch3.$17,sketch3.$18,sketch3.$19, sketch3.$20,sketch3.$21,sketch3.$22, sketch3.$23,sketch3.$24,sketch3.$25, sketch3.$26,sketch3.$27,sketch3.$28, sketch3.$29,sketch3.$30,]

times = [sketch3.$1am, sketch3.$2am, sketch3.$3am, sketch3.$4am, sketch3.$5am, sketch3.$6am, sketch3.$7am, sketch3.$8am, sketch3.$9am, sketch3.$10am, sketch3.$11am, sketch3.$12pm, sketch3.$1pm, sketch3.$2pm, sketch3.$3pm, sketch3.$4pm, sketch3.$5pm, sketch3.$6pm, sketch3.$7pm, sketch3.$8pm, sketch3.$9pm, sketch3.$10pm, sketch3.$11pm, sketch3.$12am]
minutes = [sketch3.m1, sketch3.m2, sketch3.m3, sketch3.m4, sketch3.m5, sketch3.m6, sketch3.m7, sketch3.m8, sketch3.m9, sketch3.m10, sketch3.m11, sketch3.m12, sketch3.m13, sketch3.m14, sketch3.m15, sketch3.m16, sketch3.m17, sketch3.m18, sketch3.m19, sketch3.m20, sketch3.m21, sketch3.m22, sketch3.m23, sketch3.m24, sketch3.m25,sketch3.m26, sketch3.m27, sketch3.m28, sketch3.m29, sketch3.m30,sketch3.m31, sketch3.m32, sketch3.m33, sketch3.m34, sketch3.m35, sketch3.m36, sketch3.m37, sketch3.m38, sketch3.m39, sketch3.m40,sketch3.m41, sketch3.m42, sketch3.m43, sketch3.m44, sketch3.m45, sketch3.m46, sketch3.m47, sketch3.m48, sketch3.m49
,sketch3.m50, sketch3.m51, sketch3.m52, sketch3.m53, sketch3.m54, sketch3.m55, sketch3.m56, sketch3.m57, sketch3.m58, sketch3.m59, sketch3.m60]

secondsArray = [sketch3.l1, sketch3.l2, sketch3.l3, sketch3.l4, sketch3.l5, sketch3.l6, sketch3.l7, sketch3.l8, sketch3.l9, sketch3.l10, sketch3.l11, sketch3.l12, sketch3.l13, sketch3.l14, sketch3.l15, sketch3.l16, sketch3.l17, sketch3.l18, sketch3.l19, sketch3.l20, sketch3.l21, sketch3.l22, sketch3.l23, sketch3.l24, sketch3.l25,sketch3.l26, sketch3.l27, sketch3.l28, sketch3.l29, sketch3.l30,sketch3.l31, sketch3.l32, sketch3.l33, sketch3.l34, sketch3.l35, sketch3.l36, sketch3.l37, sketch3.l38, sketch3.l39, sketch3.l40,sketch3.l41, sketch3.l42, sketch3.l43, sketch3.l44, sketch3.l45, sketch3.l46, sketch3.l47, sketch3.l48, sketch3.l49
,sketch3.l50, sketch3.l51, sketch3.l52, sketch3.l53, sketch3.l54, sketch3.l55, sketch3.l56, sketch3.l57, sketch3.l58, sketch3.l59, sketch3.l60]


screenTemplate = new Layer
	width: 750
	height: 1334
	backgroundColor: "white"
	opacity: 100
screenTemplate.sendToBack()

contentHolder = new Layer
	width: 750
	height: 1334
	backgroundColor: null



sketch3.minutes.visible = false 
#sketch3.dayPager.content = false

#sketch3.yearPage.visible = false 

#global vars :/ :) :P
isMiddleHeld = false
isRightHeld = false
isLeftHeld = false
okToRun = false
count = 0
oddCount =1


#helper Methods

opacityToZero = (layer) ->
	layer.animate
			opacity: 0
			time: .5
			layer.sendToBack()
	#layer.visible = false
opacityUp = (layer) ->
	layer.opacity = 0
	Utils.delay .5, ->
		layer.animate
			opacity: 1
			time: 2
			delay: 1
	#layer.visible = true



sendToBottom = (item) ->
		currentImage = item.copy()
		#print(currentImage)
		currentImage.x = 10 + (count * (currentImage.width+5))
		print "count multiplier " + count
		currentImage.y = 100 #needs to be fixed
		onTotheNext = new Animation contentHolder,
		y: contentHolder.y-100
		#count = count + 1
		#print(coun
		#contentHolder.sendToBack()
		currentImage.bringToFront()
		onTotheNext.start()
		isMiddleHeld = false
				

selectRightPage = (trigger) ->
	if count == 0
		scrollPage(yearPage, "right",trigger)
	else if count == 1
		scrollPage(monthPager, "right", trigger)
	else if count == 2
		scrollPage(dayPager, "right", trigger)
	else if count == 3
		scrollPage(timePager, "right", trigger)
	else if count == 4
		scrollPage(minutePager, "right", trigger)
	else if count == 5
		scrollPage(secondsPager, "right", trigger)
selectLeftPage = (trigger) ->
	if count == 0
		scrollPage(yearPage, "left",trigger)
	else if count == 1
		scrollPage(monthPager, "left", trigger)
	else if count == 2
		scrollPage(dayPager, "left",trigger)
	else if count == 3
		scrollPage(timePager, "left",trigger)
	else if count == 4
		scrollPage(minutePager, "left", trigger)
	else if count == 5
		scrollPage(secondsPager, "left",trigger)

forceTapSelection =() ->
	if count == 0
		sendToBottom(yearPage.currentPage)
		opacityToZero(yearPage)
		opacityUp(monthPager)
	else if count == 1
		sendToBottom(monthPager.currentPage)
		opacityToZero(monthPager)
		opacityUp(dayPager)
	else if count == 2
		sendToBottom(dayPager.currentPage)
		opacityToZero(dayPager)
		opacityUp(timePager)
	else if count == 3
		sendToBottom(timePager.currentPage)
		opacityToZero(timePager)
		opacityUp(minutePager)
	else if count == 4
		sendToBottom(minutePager.currentPage)
		opacityToZero(minutePager)
		opacityUp(secondsPager)
	else if count == 5
		sendToBottom(secondsPager.currentPage)
		opacityToZero(secondsPager)

timeAttributes = [images, months, days]

inputRest = new Layer
	midX:screenTemplate.width/2, y:400, width:156, height:156,backgroundColor: "grey"
	borderRadius: 100
inputRest.animate
	properties:
		opacity: 0
	repeat: 200
	time: .5
	delay: 0.25
  
dropTargetRight = new Layer width:screenTemplate.width/4, height:screenTemplate.height, backgroundColor: "teal", x:screenTemplate.width - screenTemplate.width/4, opacity: 0.00
dropTargetRight.html = "right"

dropTargetLeft = new Layer y:0, width:screenTemplate.width/4, height:screenTemplate.height, backgroundColor: "teal", opacity: 0.00
dropTargetLeft.html = "left"


inputRest.draggable.enabled = true
inputRest.draggable.vertical = false
initX = inputRest.x
initY = inputRest.y
inputRest.draggable.speedX = .8
inputRest.draggable.constraints =
    width: 750
    height: 200
inputRest.draggable.overdrag = false

#inputRest.on Events.TouchMove, ->
#	inputRest.animateStop

inputRest.onForceTap ->
	#print count
	forceTapSelection()
	count = count + 1
	#print(yearPage.currentPage)
	#yearPage.opacity = 0
	playSound()
	
#pages
yearPage = new PageComponent
	parent: contentHolder
	width:sketch3.$2013.width
	#x: screen.width/2
	height:sketch3.$2013.height
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$2013.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:280
monthPager = new PageComponent
	parent: contentHolder
	width:sketch3.$2013.width
	opacity: 0
	height:sketch3.$2013.height
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$2013.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:380
dayPager = new PageComponent
	parent: contentHolder
	width:sketch3.$1.width
	opacity:0
	height:sketch3.$1.height
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$1.width/2)
	y:480
timePager = new PageComponent
	parent: contentHolder
	width:sketch3.$1am.width
	opacity:0
	height:sketch3.$1am.height+10
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$1am.width/2)
	y:580
minutePager = new PageComponent
	parent: contentHolder
	width:sketch3.m1.width
	opacity:0
	height:sketch3.m1.height + 10
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.m1.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:680
secondsPager = new PageComponent
	parent: contentHolder
	width:sketch3.$1.width
	opacity:0
	height:sketch3.$1.height+5
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$1.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:780


#fill pages
for day in days
	dayPager.addPage day
	#day.bringToFront()
	
for month in months
	monthPager.addPage month
	#month.bringToFront()
	
for image in images
	yearPage.addPage image
	#image.bringToFront

for time in times
	timePager.addPage time
	#time.bringToFront
	
for minute in minutes
	minutePager.addPage minute
	#minute.bringToFront
	
for second in secondsArray
	secondsPager.addPage second

#set default
yearPage.snapToPage(sketch3.$2017, false)
monthPager.snapToPage(sketch3.feb, false)
dayPager.snapToPage(sketch3.$2, false)
secondsPager.snapToPage(sketch3.l3,false)

#animation
inputRest.on Events.DragEnd, ->
	inputRest.animate 
		properties:
			x: initX,
			y: initY
			curve: "spring(300,18,10)"

inputRest.on Events.Drag, ->
	endX = Math.abs(screenTemplate.midX - inputRest.midX)
	print endX
	if endX < 80 
		oddCount = 2
		
	if endX > 200 && oddCount%2 == 0
		oddCount = oddCount + 1 
		#print "oddCount" + oddCount
		#Utils.delay .7, ->
		triggerDirection(dropTargetLeft,"left")
		triggerDirection(dropTargetRight,"right")
	else
		#print(Math.abs(screenTemplate.midX - inputRest.midX))
	
#inputRest.on Events.DragEnd, ->
#	Utils.delay .5, ->
#		triggerDirection(dropTargetLeft)
#		triggerDirection(dropTargetRight)

#Helper Methods
scrollPage = (page, direction, trigger) ->
	page.snapToNextPage(
		direction 
		true 
		time:.3
		Utils.delay .3, ->
			dX = Math.abs(trigger.midX - inputRest.midX)
			dY = Math.abs(trigger.midY - inputRest.midY)
			if dX <= 100 && dY < 500
				scrollPage(page, direction, trigger)
	)
	
triggerDirection = (trigger,direction) ->
	dX = Math.abs(trigger.midX - inputRest.midX)
	dY = Math.abs(trigger.midY - inputRest.midY)
	endX = Math.abs(screenTemplate.midX - inputRest.midX)
	#print endX		
	#print dX
	#print dY
	if dX <= 110 && dY < 500 #decides between left right
		if direction == "right"
			print("right")
			selectRightPage(trigger)
			trigger.backgroundColor = "green"
		else
			print("left")
			trigger.backgroundColor = "green"
			selectLeftPage(trigger)
	else
		trigger.backgroundColor = "teal"
		
