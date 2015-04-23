LayerWithSwipe = require('./layerWithSwipe')

AppLayer = LayerWithSwipe.extend
  ctor : ->
    @_super
      x : 100
      y : 100
      dt : 0.2

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = AppScene
