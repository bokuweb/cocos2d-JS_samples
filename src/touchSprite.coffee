TouchSprite = cc.Sprite.extend
  ctor : (texture)->
    @_super texture
    cc.eventManager.addListener
      event : cc.EventListener.TOUCH_ONE_BY_ONE
      swallowTouches : true
      onTouchBegan : @onTouchBegan
      onTouchMoved : @onTouchMoved
      onTouchEnded : @onTouchEnded
    , this

  onTouchBegan : (touch, event)->
    target = event.getCurrentTarget()
    locationInNode = target.convertToNodeSpace touch.getLocation()
    s = target.getContentSize()
    rect = cc.rect 0, 0, s.width, s.height
    if cc.rectContainsPoint rect, locationInNode
      cc.log "touch began!!"
      return true

  onTouchMoved : (touch, event)->
    target = event.getCurrentTarget()
    touchPoint = touch.getLocation()
    target.x = touchPoint.x
    target.y = touchPoint.y
    cc.log "touch moved!!"

  onTouchEnded : (touch, event)->
    target = event.getCurrentTarget()
    cc.log "touch ended!!"

AppScene = cc.Scene.extend
  onEnter:->
    @_super()
    layer = new AppLayer()
    @addChild layer

module.exports = TouchSprite
