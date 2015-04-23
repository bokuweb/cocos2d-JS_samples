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
    @_score = 0
    @_preallocateNotes()
    @_addScoreLabel()
    @_addJudgeLabel()
    @_timer.start()
    @scheduleUpdate()

  update : ->
    timing = params.note[@_notesIndex]?.timing
    currentTime = @_timer.get()
    if timing - 3 < currentTime
      @_notes[@_notesIndex++].start()

  _preallocateNotes : ->
    size = cc.director.getWinSize()
    for v in params.note
      noteParams =
        timing    : v.timing
        destY     : params.destY
        speed     : params.speed
        threshold : params.threshold
      note = new Note res.testImage, noteParams, @_timer

      note.attr
        x : v.key * 100 + 10
        y : size.height + note.height

      @addChild note
      note.addListener 'great', @_greatJudged.bind this
      note.addListener 'good' , @_goodJudged.bind  this
      note.addListener 'bad'  , @_badJudged.bind   this
      @_notes.push note

  _addJudgeLabel : ->
    size = cc.director.getWinSize()
    @_judgeLabel = new cc.LabelTTF "", "Arial", 14
    @_judgeLabel.attr
      x : size.width / 2
      y : size.height /2
      opacity : 0
    @addChild @_judgeLabel

  _addScoreLabel : ->
    size = cc.director.getWinSize()
    @_scoreLabel = new cc.LabelTTF "0", "Arial", 14
    @_scoreLabel.attr
      x : size.width - 200
      y : size.height - 100
    @addChild @_scoreLabel

  _greatJudged : ->
    @_score += 100000 / params.note.length
    @_scoreLabel.setString ~~(@_score.toFixed())
    @_judgeLabel.setString 'great'
    @_showJudgeLabel()

  _goodJudged : ->
    @_score += 100000 / params.note.length * 0.7
    @_scoreLabel.setString ~~(@_score.toFixed())
    @_judgeLabel.setString 'good'
    @_showJudgeLabel()

  _badJudged : ->
    @_judgeLabel.setString 'bad'
    @_showJudgeLabel()

  _showJudgeLabel : ->
    @_judgeLabel.runAction(
      cc.sequence(
        cc.fadeIn  0.2
        cc.fadeOut 1
      )
    )

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
