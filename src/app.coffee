Res = require('./resource').res

AppLayer = cc.Layer.extend
  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    @_sprite = new cc.Sprite Res.testImage
    @_sprite.x = size.width / 2
    @_sprite.y = size.height / 2
    @addChild @_sprite
    @schedule @_move, 1

  # 1秒ごとに呼ばれる
  _move : ->
    @_sprite.x += 10

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
