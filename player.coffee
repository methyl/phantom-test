class Player
  constructor: (@cakeCanvas, @duration) ->
    @movie_id = 1
    @nextFrame  = 0
    @interval   = 40
    @audioFilesLoaded = 0

  setup: ->
    @setupListeners()
    @playing = true

  setupListeners: ->
    @cakeCanvas.addFrameListener(@captureFrame)
    @cakeCanvas.addFrameListener(@checkFinish)

  mute: =>
    @audio.pause()

  hide: =>
    $(@cakeCanvas.canvas).hide()
    @audio.pause()

  resume: =>
    @audio.resume()
    @cakeCanvas.play()
    @playing = true

  start: ->
    @cakeCanvas.time = 0
    @audio.play()
    @resume()

  stop: ->
    @audio.pause()
    @cakeCanvas.stop()
    @playing = false

  seek: (time) =>
    @cakeCanvas.stop()
    @cakeCanvas.time = time
    @cakeCanvas.play()

  captureFrame: (time) =>
    if time >= @nextFrame
      @cakeCanvas.stop()
      @nextFrame += @interval
      window.callPhantom(@cakeCanvas.canvas.toDataURL())
      @cakeCanvas.play()

  checkFinish: (time) =>
    if time > @duration
      @stop()

  size: =>
    @duration / @interval + 1

window.Player = Player