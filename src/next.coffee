Layer = cc.LayerColor.extend
  ctor : ->
    @_super cc.color(0,0,255)

NextScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = NextScene
