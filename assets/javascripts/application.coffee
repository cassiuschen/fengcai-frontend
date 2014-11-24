window.base =
	Init : () ->
		window.base.DrawTab()
		window.base.DrawToLine()
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

$(document).ready ->
	window.base.Init()
	return