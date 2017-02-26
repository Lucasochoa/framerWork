# Import file "numberImages" (sizes and positions are scaled 1:2)
sketch3 = Framer.Importer.load("imported/numberImages@2x")

images = [sketch3.$2012, sketch3.$2013, sketch3.$2014, sketch3.$2015, sketch3.$2016, sketch3.$2017, sketch3.$2018, sketch3.$2019, sketch3.$2020]

months = [sketch3.jan, sketch3.feb, sketch3.mar, sketch3.apr, sketch3.may, sketch3.jun, sketch3.jul,sketch3.aug, sketch3.sep, sketch3.oct, sketch3.nov, sketch3.dec]

days = [sketch3.$1, sketch3.$2,sketch3.$3,sketch3.$4, sketch3.$5,sketch3.$6,sketch3.$7, sketch3.$8,sketch3.$9,sketch3.$10, sketch3.$11,sketch3.$12,sketch3.$13, sketch3.$14,sketch3.$15,sketch3.$16, sketch3.$17,sketch3.$18,sketch3.$19, sketch3.$20,sketch3.$21,sketch3.$22, sketch3.$23,sketch3.$24,sketch3.$25, sketch3.$26,sketch3.$27,sketch3.$28, sketch3.$29,sketch3.$30,]

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
	x: screen.width/4
	#y: 370 - (i* (sketch3.apr.height+40))
	y:280
	originX: 2
	
monthPager = new PageComponent
	parent: contentHolder
	width:sketch3.$2013.width
	#x: screen.width/2
	height:sketch3.$2013.height
	scrollVertical: false
	x: screen.width/4
	#y: 370 - (i* (sketch3.apr.height+40))
	y:380
	originX: 2
	
dayPager = new PageComponent
	parent: contentHolder
	width:sketch3.$2013.width
	#x: screen.width/2
	height:sketch3.$2013.height
	scrollVertical: false
	x: screen.width/4
	#y: 370 - (i* (sketch3.apr.height+40))
	y:480
	originX: 2
	
	
	
#helperMethods
sendToBottom = (item) ->
	item.on Events.Click, (event, layer)->
		currentImage = layer.copy()
		print(currentImage)
		currentImage.x = 10 + (sketch3.feb.width*count)
		currentImage.y = 1200 #needs to be fixed
		onTotheNext = new Animation contentHolder,
		y: contentHolder.y-100
		count = count + 1
		print(count)
		onTotheNext.start()
		
for day in days
	dayPager.addPage day
	sendToBottom(day)
	
for month in months
	monthPager.addPage month
	sendToBottom(month)

for image in images
	pager.addPage image
	image.on Events.Click, (event, layer)->
		currentImage = layer.copy()
		print(currentImage)
		currentImage.x = 10
		currentImage.y = 1200 #needs to be fixed
		onTotheNext = new Animation contentHolder,
		y: contentHolder.y-100
		count = count + 1
		print(count)
		onTotheNext.start()

	
pager.snapToPage(sketch3.$2017, false)
monthPager.snapToPage(sketch3.feb, false)
dayPager.snapToPage(sketch3.$2, false)

rightTrigger.on Events.LongPress, ()->
	isRightHeld = true
	print(isRightHeld)
	doRightTrigger()
	rightTrigger.ignoreEvents = true
	Utils.delay 1
	rightTrigger.ignoreEvents = false
		
		
	
rightTrigger.on Events.TouchEnd, ()->
	isRightHeld = false
	print(isRightHeld)
	


#rightTrigger.on Events.TouchStart, () ->
doRightTrigger = () ->
	if isRightHeld == true
		if count == 0
			scrollPageRight(pager)
			
		else if count == 1
			scrollPageRight(monthPager)
		else if count == 2
			scrollPageRight(dayPager)
	

leftTrigger.on Events.TouchStart, () ->
		if count == 0
			scrollPageLeft(pager)
		else if count == 1
			scrollPageLeft(monthPager)
		else if count == 2
			scrollPageLeft(dayPager)

scrollPageRight = (page) ->
	page.snapToNextPage("right", true, animationOptions = time:.5)
	Utils.delay .5
	
scrollPageLeft = (page) ->
	page.snapToNextPage("left", true, animationOptions = time:.5)
	Utils.delay .5
	


