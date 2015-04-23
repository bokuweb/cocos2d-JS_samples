Timer = require('./timer')
Note  = require('./note')
res   = require('./resource').res

AppLayer = cc.Layer.extend
  DESTY : 100
  SPEED : 100
  ctor : ->
    @_super()
    @_timer = new Timer()
    @_notesIndex = 0
    @_notes = []
    @_timer.start()
    size = cc.director.getWinSize()

    for v in noteParams
      note = new Note res.testImage, v.timing, @DESTY, @SPEED, @_timer
      note.attr
        x : v.key * 100 + 10
        y : -size.height
      @addChild note
      @_notes.push note
    @scheduleUpdate()

  update : ->
    timing = noteParams[@_notesIndex]?.timing
    currentTime = @_timer.get()
    if timing - 3 < currentTime
      @_notes[@_notesIndex++].start()

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

noteParams = [
  {timing : 1, key : 0}
  {timing : 2, key : 1}
  {timing : 3, key : 2}
  {timing : 4, key : 3}
  {timing : 5, key : 4}  
]

module.exports = AppScene
