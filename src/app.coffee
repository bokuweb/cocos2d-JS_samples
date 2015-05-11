Res = require('./resource').res

Layer = cc.Layer.extend

  ctor : ->
    @_super()
    size = cc.director.getWinSize()
    emitter = new cc.ParticleSystem Res.texturePlist 
    emitter.x = size.width / 2
    emitter.y = size.height / 2
    @addChild emitter

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
