window.base =
	Init : () ->
		#window.base.DrawTab()
		#window.base.DrawToLine()
		window.base.ResetSquireDivHeight()
		window.base.ResetInfoDivPosition()
	# Canvas
	DrawTab : () ->
		tabs = $('canvas.tab')
		for tab in tabs
			ctx = tab.getContext("2d")
			ctx.fillStyle = '#e13030'
			ctx.fillRect 0,0,30,7

	DrawToLine : () ->
		tabs = $('canvas.to')
		for tab in tabs
			ctx = tab.getContext("2d")
			ctx.strokeStyle = '#fff'
			ctx.lineWidth = 2
			ctx.moveTo 0,30
			ctx.lineTo 20,0
			ctx.stroke()
	# Player
	ResetSquireDivHeight : () ->
		@width = $(window).width()
		#console.log "Resizing...#{@width}px"
		if @width <= 960 && @width > 480
			$('[class^="player-"]').css("height", @width / 2)
		if @width <= 480
			$('[class^="player-"]').css("height", @width)
		#$('.players [class^="player-"]').css("height", $('[class^="player-"]').width())
		if @width > 960
			$('[class^="player-"]').css("height", 480)
			$('.players [class^="player-"]').css("height", 240)
	ResetInfoDivPosition : () ->
		@width = $(window).width()
		if @width <= 960 && @width > 480
			$('[class^="player-"] .info').css("top", @width / 2 - 20 - 70)
			$('[class^="player-"] .info').css("height", 70)
		if @width <= 480
			$('[class^="player-"] .info').css("top", @width - 20 - 70)
			$('[class^="player-"] .info').css("height", 70)
		if @width > 960
			$('[class^="player-"] .info').css("top", 350)
			$('[class^="player-"] .info').css("height", 70)
			$('.players [class^="player-"] .info').css("top", 160)
			$('.players [class^="player-"] .info').css("height", 50)


$(document).ready ->
	window.base.Init()
	return

window.onresize = ->
	window.base.ResetSquireDivHeight()
	window.base.ResetInfoDivPosition()
