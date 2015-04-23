Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite

    move = cc.moveBy 2, 100, 100
    moveBack = move.reverse()
    delay = cc.delayTime 0.1
    seq = cc.sequence move, delay, moveBack, delay.clone()

    @_sprite.runAction seq

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
