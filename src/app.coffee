Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite
    controlPoints = [
      cc.p 100, 100
      cc.p 200, 200
      cc.p 0,   0
    ]
    @_sprite.runAction(cc.bezierTo(3, controlPoints))

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
