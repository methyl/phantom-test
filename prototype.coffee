class Template.Prototype
  length: 71000
  constructor: Template.Base.constructor
  nextSnippet: Template.Base.nextSnippet
  createTextSnippets: Template.Base.createTextSnippets
  createBackground: Template.Base.createBackground

  createShapes: =>
    @createBackground('#fff')
    @createRectangle()
    #@createLogo()
    @createShine()
    @createTextSnippets()

  animateShapes: =>
    #@animateLogo()
    @animateRectangle()
    @animateTextSnippets()

  createLogo: =>
    imageObject = Object.loadImage(@logoURL)
    @logo = new ImageNode(imageObject, {centered: true})

    @logoMove    = new Timeline()
    @logoOpacity = new Timeline()

    @logo.addTimeline @logoMove
    @logo.addTimeline @logoOpacity

    @CAKECanvas.append(@logo)

  createRectangle: =>
    @rectangle        = new Rectangle(@width, @height, {id: "rectangle", fill: @mainColor})
    @rectangleMove    = new Timeline()
    @rectangleShape   = new Timeline()
    @rectangleOpacity = new Timeline()

    @rectangle.addTimeline @rectangleMove
    @rectangle.addTimeline @rectangleShape
    @rectangle.addTimeline @rectangleOpacity

    @CAKECanvas.append(@rectangle)

  createShine: =>
    @shine = new Rectangle(@width, @height, {id: "shine", fill: @shineGradient()})
    @CAKECanvas.append(@shine)

  shineGradient: =>
    new Gradient(
      type:       "radial"
      endRadius:  @height / 1.5
      startX:     @width  * 0.5
      startY:     @height * 0.5
      endX:       @width  * 0.5
      endY:       @height * 0.5
      colorStops: [[0, "rgba(255, 255, 255, 0.5)"], [1.0, "rgba(216, 216, 216, 0.3)"]]
    )

  getSnippetStyles: ->
    [
      ["left",    @mainColor, "21px Verdana", 43, 2500,   'Need a professional video for your website?']
      ["center",  "#fff",     "21px Verdana", 30, 6300,   'You\'ve come to the right place']
      ["left",    "#fff",     "21px Verdana", 10, 8000,   'Welcome to']
      ["center",  "#fff",     "24px Verdana", 17, 12000,  'With Video Rascal']
      ["center",  "#000",     "36px Verdana", 7,  12500,  'you can']
      ["center",  "#fff",     "24px Verdana", 6,  13000,  'CREATE']
      ["center",  "#fff",     "52px Verdana", 20, 13500,  'a Professional Video']
      ["center",  "#fff",     "36px Verdana", 9,  14000,  'like this']
      ["center",  "#000",     "92px Verdana", 10, 15000,  'in minutes']
      ["right",   "#fff",     "36px Verdana", 9,  15000,  'not weeks']
      ["center",  "#fff",     "21px Verdana", 37, 18000,  'For a fraction of what agency charges']
      ["center",  "#fff",     "36px Verdana", 43, 22600,  'CREATING A VIDEO\nWITH VIDEO RASCAL IS EASY']
      ["center",  "#000",     "36px Verdana", 14, 24000,  '3 easy steps)']
      ["left",    "#fff",     "21px Verdana", 22, 25600,  '1. Give us your script']
      ["left",    "#fff",     "21px Verdana", 40, 27500,  '2. Choose a template,\nand style options']
      ["left",    "#fff",     "21px Verdana", 40, 30500,  '3. Record a voice over\nand select music']
      ["left",    "#fff",     "36px Verdana", 73, 35300,  'THEN EXPORT THE\nVIDEO FOR USE ON\nYOUR WEBSITE &\nSOCIAL MEDIA\nCHANNELS']
      ["center",  @mainColor, "24px Verdana", 44, 38000,  'The whole process takes less then 10 minutes']
      ["center",  "#fff",     "24px Verdana", 28, 41000,  "And there's no need to worry"]
      ["center",  @mainColor, "24px Verdana", 28, 42300,  'And there\'s no need to worry']
      ["center",  "#fff",     "24px Verdana", 29, 42600,  'because all video come with a']
      ["center",  "#fff",     "92px Verdana", 9,  43600,  'GUERANTEE']
      ["center",  "#fff",     "24px Verdana", 49, 45000,  'If you aren\'t satisfied we\'ll\nrefund your money.']
      ["left",    "#fff",     "21px Verdana", 43, 48600,  'But why do I even need a video for my site?']
      ["center",  @mainColor, "36px Verdana", 86, 51300,  'Studies have shown\nthat adding professional\nvideo to a website helps\nINCREASE sales']
      ["center",  "#fff",     "24px Verdana", 19, 55000,  'WHO DOESN\'T WANT TO']
      ["center",  "#fff",     "24px Verdana", 15, 56500,  'INCREASE SALES?']
      ["center",  @mainColor, "21px Verdana", 28, 60500,  'So what are you waiting for?']
    ]

  animateLogo: =>
    @logoMove.addKeyframe @start_time + 0,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @logoMove.addKeyframe @start_time + 9800,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @logoMove.addKeyframe @start_time + 10000,
      x: @width * 0.5
      y: @height * 0.1
    @logoMove.addKeyframe @start_time + 68000,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @logoOpacity.addKeyframe @start_time + 0,
      opacity: 0
    , "set"
    @logoOpacity.addKeyframe @start_time + 9000,
      opacity: 0
    , "set"
    @logoOpacity.addKeyframe @start_time + 9300,
      opacity: 1.0
    @logoOpacity.addKeyframe @start_time + 13500,
      opacity: 1.0
    , "set"
    @logoOpacity.addKeyframe @start_time + 13700,
      opacity: 0
    @logoOpacity.addKeyframe @start_time + 68000,
      opacity: 0
    , "set"
    @logoOpacity.addKeyframe @start_time + 69000,
      opacity: 1.0

  animateRectangle: =>
    @rectangleMove.addKeyframe @start_time + 0,
      x: 0
      y: @height
    , "set"
    @rectangleMove.addKeyframe @start_time + 1500,
      x: 0
      y: @height
    , "set"
    @rectangleMove.addKeyframe @start_time + 2000,
      x: 0
      y: @height * 0.5
    @rectangleMove.addKeyframe @start_time + 2500,
      x: 0
      y: @height * 0.55
    @rectangleShape.addKeyframe @start_time + 0,
      scale: 1
      rotation: 0
    , "set"
    @rectangleOpacity.addKeyframe @start_time + 0,
      opacity: 1.0

    @rectangleMove.addKeyframe @start_time + 4500,
      x: 0
      y: (@height * 0.5) + 50
    , "set"
    @rectangleMove.addKeyframe @start_time + 5000,
      x: @width * 0.5
      y: @height

    @rectangleMove.addKeyframe @start_time + 5500,
      x: 0
      y: @height

    @rectangleShape.addKeyframe @start_time + 4500,
      scale: 1
      rotation: 0
    , "set"
    @rectangleShape.addKeyframe @start_time + 5000,
      scale: 2
      rotation: -Math.PI * 0.5

    @rectangleMove.addKeyframe @start_time + 7000,
      x: 0
      y: @height
    , "set"
    @rectangleMove.addKeyframe @start_time + 7300,
      x: @width * 0.5
      y: @height * 0.5

    @rectangleMove.addKeyframe @start_time + 7600,
      x: @width * 0.5
      y: 0

    @rectangleShape.addKeyframe @start_time + 7300,
      scale: 2
      rotation: -Math.PI * 0.5
    , "set"
    @rectangleShape.addKeyframe @start_time + 7600,
      scale: 1
      rotation: 0

    @rectangleMove.addKeyframe @start_time + 8600,
      x: @width * 0.5
      y: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 9300,
      x: @width
      y: 0

    @rectangleShape.addKeyframe @start_time + 8600,
      scale: 1
      rotation: 0
    , "set"
    @rectangleShape.addKeyframe @start_time + 9300,
      scale: 0.5
      rotation: -Math.PI * 0.5

    @rectangleMove.addKeyframe @start_time + 9600,
      x: 0
      y: @height
    , "set"
    @rectangleMove.addKeyframe @start_time + 10000,
      x: 0
      y: @height * 0.25

    @rectangleShape.addKeyframe @start_time + 9600,
      scale: 1
      rotation: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 13000,
      x: 0
      y: @height * 0.25
    , "set"
    @rectangleMove.addKeyframe @start_time + 13500,
      x: 0
      y: @height

    @rectangleMove.addKeyframe @start_time + 13700,
      x: 0
      y: 0

    @rectangleMove.addKeyframe @start_time + 37000,
      x: -@width
      y: -@height
    , "set"
    @rectangleMove.addKeyframe @start_time + 38000,
      x: @width
      y: @height * 2.5

    @rectangleShape.addKeyframe @start_time + 37000,
      scale: 2
      rotation: 0
    , "set"
    @rectangleShape.addKeyframe @start_time + 38000,
      scale: 2
      rotation: -Math.PI + 0.0001


    #Something wired happen when you do PI rotation. It looks the same with 0.0001 and works as expected
    @rectangleMove.addKeyframe @start_time + 40500,
      x: @width
      y: @height * 0.5
    , "set"
    @rectangleMove.addKeyframe @start_time + 40700,
      x: 0
      y: 0

    @rectangleShape.addKeyframe @start_time + 40500,
      scale: 2
      rotation: Math.PI * 0.5
    , "set"
    @rectangleShape.addKeyframe @start_time + 40700,
      scale: 1
      rotation: 0

    @rectangleMove.addKeyframe @start_time + 42300,
      x: 0
      y: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 42500,
      x: 0
      y: @height * 0.2

    @rectangleMove.addKeyframe @start_time + 47600,
      x: 0
      y: @height * 0.2
    , "set"
    @rectangleMove.addKeyframe @start_time + 48000,
      x: 0
      y: 0

    @rectangleMove.addKeyframe @start_time + 48300,
      x: 0
      y: @height

    @rectangleMove.addKeyframe @start_time + 48300,
      x: -@width
      y: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 49000,
      x: -@width * 0.2
      y: 0

    @rectangleMove.addKeyframe @start_time + 50500,
      x: -@width * 0.2
      y: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 51000,
      x: @width
      y: 0

    @rectangleShape.addKeyframe @start_time + 50500,
      scale: 1
      rotation: 0
    , "set"
    @rectangleShape.addKeyframe @start_time + 51000,
      scale: 0.1
      rotation: -Math.PI * 0.5

    @rectangleMove.addKeyframe @start_time + 54500,
      x: 0
      y: 0
    , "set"
    @rectangleShape.addKeyframe @start_time + 54500,
      scale: 1
      rotation: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 59500,
      x: 0
      y: 0
    , "set"
    @rectangleMove.addKeyframe @start_time + 61000,
      x: 0
      y: @height * 0.75

    @rectangleMove.addKeyframe @start_time + 61500,
      x: 0
      y: @height * 0.5

    @rectangleOpacity.addKeyframe @start_time + 66000,
      opacity: 1.0

    @rectangleOpacity.addKeyframe @start_time + 67300,
      opacity: 0

  animateTextSnippets: =>
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 2500,
      x: @width * 0.05
      y: @height
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 3000,
      x: @width * 0.07
      y: @height * 0.4

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 2500,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 3000,
      opacity: 1.0

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 4500,
      x: @width * 0.07
      y: (@height * 0.5)
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 5000,
      x: @width * 0.4
      y: @height

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 5500,
      x: -@width * 0.1
      y: @height

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 4500,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 5000,
      scale: 1
      rotation: -Math.PI * 0.5 + 0.0001

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 6300,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 7300,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 7600,
      x: @width * 2
      y: @height * 0.5

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 6300,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 7000,
      opacity: 1.0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 8000,
      x: @width * 0.5 - 100
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 8600,
      x: @width * 0.52
      y: @height * 0.5

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 9300,
      x: @width * 2
      y: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 12000,
      x: @width * 0.3
      y: @height * 0.45
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15000,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 12500,
      x: @width * 0.35
      y: @height * 0.55
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15000,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 13000,
      x: @width * 0.55
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15000,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 13500,
      x: @width * 0.5
      y: @height * 0.75
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15300,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 14000,
      x: @width * 0.25
      y: @height * 0.75
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15500,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 14000,
      scale: 1
      rotation: -Math.PI * 0.5 + 0.0001
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15000,
      x: @width * 0.5
      y: @height * 0.7
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 17000,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 15000,
      x: @width
      y: @height * 0.75
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 17000,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 18000,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      x: @width * 2
      y: @height * 2
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 19300,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 20500,
      scale: 2
      rotation: 0

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 22600,
      scale: 2
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 23300,
      scale: 0.7
      rotation: 0

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 18000,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 19300,
      opacity: 1.0

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 23500,
      opacity: 1.0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 24000,
      opacity: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 22600,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25600,
      x: @width * 0.65
      y: @height * 0.2

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 27500,
      x: @width * 0.65
      y: @height * 0.2
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 28000,
      x: @width * 0.65
      y: @height * 0

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 30500,
      x: @width * 0.65
      y: @height * 0
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 32600,
      x: @width * 0.65
      y: -@height * 0.2

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      x: @width * 0.65
      y: -@height * 0.2
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.40
      y: @height * 0.2

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 37600,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 22600,
      scale: 4
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 23600,
      scale: 1
      rotation: 0

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 25600,
      scale: 2
      rotation: 0

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      scale: 2
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      scale: 0.8
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 24000,
      x: @width * 0.5
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      x: @width * 0.5
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25600,
      x: @width * 0.65
      y: @height * 0.5

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 27500,
      x: @width * 0.65
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 28000,
      x: @width * 0.65
      y: @height * 0.3

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 30500,
      x: @width * 0.65
      y: @height * 0.3
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 32600,
      x: @width * 0.65
      y: @height * 0.1

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      x: @width * 0.65
      y: @height * 0.1
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.40
      y: @height * 0.32

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 37800,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 25600,
      scale: 2
      rotation: 0

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      scale: 2
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      scale: 0.8
      rotation: 0

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 24000,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 25000,
      opacity: 1.0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 25600,
      x: @width * 0.3
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 27500,
      x: @width * 0.3
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 28000,
      x: @width * 0.3
      y: @height * 0.45

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 30500,
      x: @width * 0.3
      y: @height * 0.45
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 32600,
      x: @width * 0.3
      y: @height * 0.25

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      x: @width * 0.3
      y: @height * 0.25
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.05
      y: @height * 0.48

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 37900,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      scale: 0.7
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 27500,
      x: @width * 0.3
      y: @height * 0.85
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 28000,
      x: @width * 0.3
      y: @height * 0.65

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 30500,
      x: @width * 0.3
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 32600,
      x: @width * 0.3
      y: @height * 0.45

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      x: @width * 0.3
      y: @height * 0.45
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.05
      y: @height * 0.64

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 38000,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      scale: 0.7
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 30500,
      x: @width * 0.3
      y: @height * 0.85
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 32600,
      x: @width * 0.3
      y: @height * 0.65

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      x: @width * 0.3
      y: @height * 0.65
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.05
      y: @height * 0.80

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 38100,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 34600,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      scale: 0.7
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      x: @width * 0.4
      y: @height * 0.3
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 37300,
      x: @width * 2
      y: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 35300,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 35600,
      opacity: 1.0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 38000,
      x: @width * 0.5
      y: @height * 0.45
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 40500,
      x: @width * 0.5
      y: @height * 0.45
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 40700,
      x: -@width * 0.1
      y: @height * 0.5

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 40500,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 40700,
      scale: 1
      rotation: -Math.PI * 0.5 + 0.0001

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 41000,
      x: @width * 0.5
      y: @height * 0.1
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 42500,
      x: @width * 2
      y: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 42300,
      opacity: 1.0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 42500,
      opacity: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 42300,
      x: @width * 0.5
      y: @height * 0.1
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 47800,
      x: @width * 2
      y: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 42300,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 42500,
      opacity: 1.0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 42600,
      x: @width * 0.5
      y: @height * 0.25
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 48100,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 43600,
      x: @width * 0.5
      y: @height * 0.6
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 44000,
      x: @width * 0.5
      y: @height * 0.6
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 44500,
      x: @width * 0.5
      y: @height * 0.5

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 48200,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 43600,
      scale: 0.1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 44000,
      scale: 1
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 45000,
      x: @width * 0.5
      y: @height * 0.8
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 48300,
      x: @width * 2
      y: 0
    , "set"
    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 48600,
      x: @width
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 49600,
      x: 0
      y: @height * 0.5

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 50500,
      x: 0
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 51000,
      x: @width
      y: 0

    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 50500,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 51000,
      scale: 0.1
      rotation: -Math.PI * 0.5

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 51300,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 54500,
      x: @width * 2
      y: @height * 2
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 54000,
      scale: 1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 54500,
      scale: 5
      rotation: 0

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 51300,
      opacity: 0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 54000,
      opacity: 1.0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 55000,
      x: @width * 0.5
      y: @height * 0.4
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 60000,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 55000,
      scale: 0.1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 56000,
      scale: 1
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 56500,
      x: @width * 0.5
      y: @height * 0.7
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 57500,
      x: @width * 0.5
      y: @height * 0.7
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 59500,
      x: @width * 0.5
      y: @height * 0.6

    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 60500,
      x: @width * 2
      y: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 56500,
      scale: 0.1
      rotation: 0
    , "set"
    @textShapeTimelines[@currentSnippet].addKeyframe @start_time + 57500,
      scale: 1
      rotation: 0

    @nextSnippet()
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 60500,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 61300,
      x: @width * 0.5
      y: @height * 0.5
    , "set"
    @textMoveTimelines[@currentSnippet].addKeyframe @start_time + 61500,
      x: @width * 0.5
      y: @height * 0.4

    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 66000,
      opacity: 1.0
    , "set"
    @textOpacityTimelines[@currentSnippet].addKeyframe @start_time + 67300,
      opacity: 0