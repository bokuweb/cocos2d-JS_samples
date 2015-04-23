Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite

    seq = cc.sequence(
      cc.fadeTo 1, 0
      cc.fadeTo 1, 255
    )

    @_sprite.runAction seq.repeat(3)

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
