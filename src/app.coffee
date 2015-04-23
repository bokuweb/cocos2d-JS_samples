Timer = require('./timer')

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    @_timer = new Timer()
    @_timer.start()
    @scheduleUpdate()
    size = cc.director.getWinSize()
    @_timerLabel = new cc.LabelTTF "0","Arial", 20
    @_timerLabel.attr
      x : size.width / 2
      y : size.height / 2
    @addChild @_timerLabel

  update : ->
    @_timerLabel.setString @_timer.get()

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
