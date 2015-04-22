Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.winSize
    sprite = new cc.Sprite Res.testImage
    sprite.x = size.width / 2
    sprite.y = size.height / 2
    @addChild sprite

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
