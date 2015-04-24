Damage = require('./damage')

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
    damage = new Damage()
    damage.x = touchPoint.x
    damage.y = touchPoint.y
    @addChild damage
    damage.show Math.random() * 99999

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new Layer()
    @addChild layer

module.exports = AppScene
