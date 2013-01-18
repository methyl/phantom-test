class Template.Base
  @constructor: (@width, @height, @mainColor, @logoURL, @snippets) ->
    @CAKECanvas     = new Canvas(document.body, @width, @height)
    @start_time     = 0
    @currentSnippet = 0
    @snippetsStyles = @getSnippetStyles()

    @createShapes()
    @animateShapes()

  @nextSnippet: ->
    @currentSnippet++

  @createTextSnippets: ->
    Template.Base.initTextSnippets(this, @snippetsStyles.length)
    Template.Base.setTextSnippets(this, @snippetsStyles.length)

  @initTextSnippets: (self, size) ->
    self.textMoveTimelines    = []
    self.textShapeTimelines   = []
    self.textOpacityTimelines = []
    self.textObjects          = []

    for i in [0...size]
      self.textObjects[i]           = new CanvasNode();
      self.textMoveTimelines[i]     = new Timeline()
      self.textShapeTimelines[i]    = new Timeline()
      self.textOpacityTimelines[i]  = new Timeline()

  @setTextSnippets: (self, size) ->
    for i in [0...size]
      Template.Base.addTextObjects(self.textObjects[i], (self.snippets[i] || self.snippetsStyles[i][5]), self.snippetsStyles[i], self.CAKECanvas)
      Template.Base.addTimelines(self.textMoveTimelines[i], self.textShapeTimelines[i], self.textOpacityTimelines[i], self.textObjects[i])
      Template.Base.setDefaultPosition(self.textMoveTimelines[i], self.textOpacityTimelines[i], self.height)

  @addTextObjects: (textObject, snippet, snippetsStyles, canvas) ->
    lines = snippet.split("\n")
    for j in [0...lines.length]
      textObject.append new TextNode(lines[j],
        fill: snippetsStyles[1]
        font: snippetsStyles[2]
        align: snippetsStyles[0]
        baseline: "middle"
        cx: 0
        cy: j * 40
      )

    canvas.append(textObject)

  @addTimelines: (moveTimeLine, shapeTimeLine, opacityTimeline, textObject) ->
    textObject.addTimeline(moveTimeLine)
    textObject.addTimeline(shapeTimeLine)
    textObject.addTimeline(opacityTimeline)

  @setDefaultPosition: (moveTimeLine, opacityTimeline, height) ->
    moveTimeLine.addKeyframe(0, {x: 0, y: height * 3, "set"})
    opacityTimeline.addKeyframe(0, {opacity: 1.0, "set"})

  @createBackground: (color) ->
    background  = new Rectangle(@width, @height, {id: "background", fill: color})
    @CAKECanvas.append(background)