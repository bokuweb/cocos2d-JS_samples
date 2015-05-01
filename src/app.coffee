Damage = require('./damage')
Res = require('./resource').res

Layer = cc.Layer.extend
  ctor : ->
    @_super()
    cc.eventManager.addListener
      event : cc.EventListener.TOUCH_ONE_BY_ONE
      swallowTouches : true
      onTouchBegan : @onTouchBegan.bind this
    , this

  onTouchBegan : (touch, event)->
    target = event.getCurrentTarget()
    touchPoint = touch.getLocation()
    emitter = new cc.ParticleSystem Res.texturePlist 
    emitter.x = touchPoint.x
    emitter.y = touchPoint.y
    batch = new cc.ParticleBatchNode emitter.texture
    batch.addChild emitter
    @addChild batch

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
