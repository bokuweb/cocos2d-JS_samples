Timer = require('./timer')
Note  = require('./note')
res   = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    @_timer = new Timer()
    @_timer.start()

    size = cc.director.getWinSize()
    note = new Note res.testImage
    note.attr
      x : size.width / 2
      y : size.height
    @addChild note

    note.start()

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
