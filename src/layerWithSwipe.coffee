LayerWithSwipe = cc.Layer.extend
  ctor : (@_threshold)->
    @_super()
    cc.eventManager.addListener
      event : cc.EventListener.TOUCH_ONE_BY_ONE
      swallowTouches : true
      onTouchBegan : @onTouchBegan.bind this
      onTouchMoved : @onTouchMoved.bind this
      onTouchEnded : @onTouchEnded.bind this
    , this

  onTouchBegan : (touch, event)->
    target = event.getCurrentTarget()
    touchPoint = touch.getLocation()
    cc.log "began!!"
    target.start =
      x : touchPoint.x
      y : touchPoint.y
    @_startTime  = new Date()
    true

  onTouchMoved : (touch, event)->
    target = event.getCurrentTarget()
    touchPoint = touch.getLocation()
    cc.log "moved!!"

  onTouchEnded : (touch, event)->
    target = event.getCurrentTarget()
    touchPoint = touch.getLocation()
    dt = (new Date() - @_startTime) / 1000
    return unless dt < @_threshold.dt
    if target.start.x - touchPoint.x < -@_threshold.x
      cc.log "swipe right"
    else if target.start.x - touchPoint.x > @_threshold.x
      cc.log "swipe left"

    if target.start.y - touchPoint.y < -@_threshold.y
      cc.log "swipe up"
    else if target.start.y - touchPoint.y > @_threshold.y
      cc.log "swipe down"

module.exports = LayerWithSwipe
