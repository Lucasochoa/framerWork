# Import file "numberImages" (sizes and positions are scaled 1:2)

sketch3 = Framer.Importer.load("imported/numberImages@2x")

images = [sketch3.$2012, sketch3.$2013, sketch3.$2014, sketch3.$2015, sketch3.$2016, sketch3.$2017, sketch3.$2018, sketch3.$2019, sketch3.$2020]
months = [sketch3.jan, sketch3.feb, sketch3.mar, sketch3.apr, sketch3.may, sketch3.jun, sketch3.jul,sketch3.aug, sketch3.sep, sketch3.oct, sketch3.nov, sketch3.dec]
days = [sketch3.$1, sketch3.$2,sketch3.$3,sketch3.$4, sketch3.$5,sketch3.$6,sketch3.$7, sketch3.$8,sketch3.$9,sketch3.$10, sketch3.$11,sketch3.$12,sketch3.$13, sketch3.$14,sketch3.$15,sketch3.$16, sketch3.$17,sketch3.$18,sketch3.$19, sketch3.$20,sketch3.$21,sketch3.$22, sketch3.$23,sketch3.$24,sketch3.$25, sketch3.$26,sketch3.$27,sketch3.$28, sketch3.$29,sketch3.$30,]

screenSize = new Layer
	width: 750
	height: 1334

isMiddleHeld = false
isRightHeld = false
isLeftHeld = false

count = 0
contentHolder = new Layer
	width: 750
	height: 1083
	backgroundColor: "blue"
rightTrigger = new Layer
	x: 582
	y: 89
	width: 168
	height: 578
	opacity: 0.50
leftTrigger = new Layer
	y: 89
	width: 211
	height: 554
selectionBoxTop = new Layer
	x: 211
	y: 58
	width: 383
	opacity: 100
	backgroundColor: "rgba(0,0,0,0.5)"

selectionBoxBottom= new Layer
	x: 211
	y: 366
	width: 383
	opacity: 1.00
	backgroundColor: "rgba(0,0,0,0.5)"

#for i in [0...2]
pager = new PageComponent
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
	#x: screen.width/2
	height:sketch3.$2013.height
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$2013.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:380
	
dayPager = new PageComponent
	parent: contentHolder
	width:sketch3.$2013.width
	#x: screen.width/2
	height:sketch3.$2013.height
	scrollVertical: false
	x: contentHolder.width/2 - (sketch3.$2013.width/2)
	#y: 370 - (i* (sketch3.apr.height+40))
	y:480
	
	
	
#helperMethods
sendToBottom = (item) ->
	item.on Events.MouseOver, (event, layer)->
		Utils.delay 1, ->
			if isMiddleHeld
				isMiddleHeld = false
				currentImage = layer.copy()
				#print(currentImage)
				currentImage.x = 10 + (sketch3.feb.width*count)
				currentImage.y = 1200 #needs to be fixed
				onTotheNext = new Animation contentHolder,
				y: contentHolder.y-100
				count = count + 1
				#print(count)
				onTotheNext.start()
				isMiddleHeld = false
				
		
for day in days
	dayPager.addPage day
	sendToBottom(day)
	
for month in months
	monthPager.addPage month
	sendToBottom(month)
	
for image in images
	pager.addPage image
	sendToBottom(image)
	
#truthTriggers
for month in months
	month.on Events.MouseOver, (event, layer)->
		isMiddleHeld = true

for image in images
	image.on Events.MouseOver, (event, layer)->
		isMiddleHeld = true
		
for day in days
	day.on Events.MouseOver, (event, layer)->
		isMiddleHeld = true
	


	
pager.snapToPage(sketch3.$2017, false)
monthPager.snapToPage(sketch3.feb, false)
dayPager.snapToPage(sketch3.$2, false)


rightTrigger.on Events.MouseOver, ()->
	#print(isRightHeld)
	print("blah")
	isRightHeld = true
	Utils.delay 
	doRightTrigger()
	rightTrigger
	isMiddleHeld = false
	
leftTrigger.on Events.MouseOver, ()->
	#print(isRightHeld)
	isLeftHeld = true
	Utils.delay 
	doLeftTrigger()
	isMiddleHeld = false

contentHolder.on Events.TouchMove, ()->
	isRightHeld = false
	isLeftHeld = false
	
	
#rightTrigger.on Events.TouchStart, () ->
doRightTrigger = () ->
	if isRightHeld == true
		if count == 0
			scrollPageRight(pager)
		else if count == 1
			scrollPageRight(monthPager)
		else if count == 2
			scrollPageRight(dayPager)
	
#leftTrigger.on Events.TouchStart, () ->
doLeftTrigger = () ->
		if count == 0
			scrollPageLeft(pager)
		else if count == 1
			scrollPageLeft(monthPager)
		else if count == 2
			scrollPageLeft(dayPager)

scrollPageRight = (page) ->
	page.snapToNextPage(
		"right" 
		true 
		time:.7
		Utils.delay .7, ->
			if isRightHeld
				scrollPageRight(page)
	)
	
scrollPageLeft = (page) ->
	page.snapToNextPage(
		"left" 
		true 
		time:.7
		Utils.delay .7, ->
			if isLeftHeld
				scrollPageLeft(page)
	)
	


