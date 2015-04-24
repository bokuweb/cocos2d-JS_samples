Layer = cc.Layer.extend
  ctor : ->
    @_super()
    cc.log "add layer"

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
