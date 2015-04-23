Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite

    cb = ->
      cc.log "callback!"
      message = new cc.LabelTTF "callback", "Arial", 20
      message.attr
        x : size.width / 2
        y : size.height / 2
      @addChild message

    seq = cc.sequence(
      cc.moveTo 2, 0, 0
      cc.fadeTo 2, 0
      cc.CallFunc.create cb, this
    )

    @_sprite.runAction seq

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
