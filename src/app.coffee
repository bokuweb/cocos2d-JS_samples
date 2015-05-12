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
    @_music = cc.audioEngine
    @_preallocateNotes()
    @_addBg()
    @_addCoverImage()
    @_addTitle()
    @_addDest()
    @_addScoreLabel()
    @_addJudgeLabel()

    @schedule @_measureMusicTime, 0.01
    @scheduleUpdate()
    @_music.playMusic params.music.src, false

  update : ->
    size = cc.director.getWinSize()
    timing = params.note[@_notesIndex]?.timing
    fallTime = (size.height - params.destY) / params.speed
    currentTime = @_timer.get()
    if timing - fallTime < currentTime
      @_notes[@_notesIndex++].start()

    if currentTime >= params.music.playTime
      cc.log "game over"

  _preallocateNotes : ->
    size = cc.director.getWinSize()
    for v in params.note
      noteParams =
        timing    : v.timing
        destY     : params.destY
        speed     : params.speed
        threshold : params.threshold
      note = new Note res.noteImage, noteParams, @_timer
      note.attr
        x : v.key * params.margin + params.offset
        y : size.height + note.height

      @addChild note, 10
      note.addListener 'judge', @_onJudge.bind this
      @_notes.push note

  _addDest : ->
    size = cc.director.getWinSize()
    for i in [0...params.keyNum]
      dest = new cc.Sprite res.destImage
      dest.attr
        x: i * params.margin + params.offset
        y: params.destY
      @addChild dest, 5

  _addBg : ->
    size = cc.director.getWinSize()
    bg = cc.Sprite.create res.bgImage
    bg.x = size.width / 2
    bg.y = size.height / 2
    @addChild bg, 0

  _addCoverImage : ->
    size = cc.director.getWinSize()
    cover = cc.Sprite.create params.music.coverImage
    cover.x = 50
    cover.y = size.height - 80
    @addChild cover, 5

  _addTitle : ->
    size = cc.director.getWinSize()
    title = new cc.LabelTTF params.music.title, "Arial", 14, cc.size(100,10), cc.TEXT_ALIGNMENT_LEFT
    title.attr
      x : 150
      y : size.height - 80
    title.setColor cc.color(0, 0, 0, 255)
    @addChild title, 5

  _addJudgeLabel : ->
    size = cc.director.getWinSize()
    @_judgeLabel = new cc.LabelTTF "", "Arial", 14
    @_judgeLabel.attr
      x : size.width / 2
      y : size.height / 2
      opacity : 0
    @_judgeLabel.setColor cc.color(0, 0, 0, 255)
    @addChild @_judgeLabel, 10

  _addScoreLabel : ->
    size = cc.director.getWinSize()
    @_scoreLabel = new cc.LabelTTF "0", "Arial", 14, cc.size(100,10), cc.TEXT_ALIGNMENT_LEFT
    @_scoreLabel.attr
      x : 150
      y : size.height - 100
    @_scoreLabel.setColor cc.color(0, 0, 0, 255)
    @addChild @_scoreLabel, 10

  _onJudge : (name, judgement)->
    if judgement is 'great'
      @_score += 100000 / params.note.length
      @_judgeLabel.setString 'great'
    else if judgement is 'good'
      @_score += 100000 / params.note.length * 0.7
      @_judgeLabel.setString 'good'
    else
      @_judgeLabel.setString 'bad'
    @_scoreLabel.setString ~~(@_score.toFixed())
    @_showJudgeLabel()

  _showJudgeLabel : ->
    seq = cc.sequence cc.fadeIn(0.2), cc.fadeOut(1)
    @_judgeLabel.runAction seq

  _measureMusicTime : ->
    if @_music.isMusicPlaying()
      @_timer.start()
      @unschedule @_measureMusicTime

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
