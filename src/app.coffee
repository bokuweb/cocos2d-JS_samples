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
    moveEaseOut = move.clone().easing(cc.easeOut(2.0))
    moveEaseOutBack = moveEaseOut.reverse()
    delay = cc.delayTime 0.1
    seq = cc.sequence moveEaseOut, delay, moveEaseOutBack, delay.clone()

    @_sprite.runAction seq

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
