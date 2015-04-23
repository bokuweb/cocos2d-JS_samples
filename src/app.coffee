Timer  = require('./timer')
Note   = require('./note')
params = require('./params')
res    = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    @_timer = new Timer()
    @_notesIndex = 0
    @_notes = []
    @_timer.start()
    size = cc.director.getWinSize()

    for v in params.note
      note = new Note(
        res.testImage
        {
          timing    : v.timing
          destY     : params.destY
          speed     : params.speed
          threshold : params.threshold
        }
        @_timer
      )
      note.attr
        x : v.key * 100 + 10
        y : size.height + note.height
      @addChild note
      note.addListener 'great', @_greatJudged.bind this
      note.addListener 'good' , @_goodJudged.bind  this
      note.addListener 'bad'  , @_badJudged.bind   this
      @_notes.push note

    @scheduleUpdate()

  update : ->
    timing = params.note[@_notesIndex]?.timing
    currentTime = @_timer.get()
    if timing - 3 < currentTime
      @_notes[@_notesIndex++].start()

  _greatJudged : ->
    cc.log "great"

  _goodJudged : ->
    cc.log "good"

  _badJudged : ->
    cc.log "bad"

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
