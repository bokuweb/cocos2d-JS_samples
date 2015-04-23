Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite
    # cc.jumpTo(ジャンプ時間, 着地座標, ジャンプ高さ, ジャンプ回数)
    @_sprite.runAction(cc.jumpTo(3, cc.p(@_sprite.x + 100, @_sprite.y), 100, 1))

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
