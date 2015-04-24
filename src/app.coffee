Next = require('./next')

Layer = cc.LayerColor.extend
  ctor : ->
    @_super cc.color(0,255,0)
    @scheduleOnce @_changeScene, 3

  _changeScene : ->
    cc.director.runScene new Next()

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
