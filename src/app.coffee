Layer = cc.LayerColor.extend
  ctor : ->
    @_super cc.color(0,255,0), 200,200

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
