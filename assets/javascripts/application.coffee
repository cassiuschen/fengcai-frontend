window.base =
	Init : () ->
		#window.base.DrawTab()
		#window.base.DrawToLine()
		window.base.ResetSquireDivHeight()
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
		console.log "Resizing...#{@width}px"
		if @width <= 960 && @width > 480
			$('[class^="player-"]').css("height", @width / 2)
		#$('.players [class^="player-"]').css("height", $('[class^="player-"]').width())
		if @width > 960
			$('[class^="player-"]').css("height", 480)
			$('.players [class^="player-"]').css("height", 240)


$(document).ready ->
	window.base.Init()
	return

window.onresize = ->
	window.base.ResetSquireDivHeight()