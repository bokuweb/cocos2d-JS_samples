TouchSprite = require './touchSprite'

Note = TouchSprite.extend

  ctor : (texture, @_timing, @_dest, @_speed, @_timer)->
    @_super texture

  start : ->
    @scheduleUpdate()

  update : ->
    currentTime = @_timer.get()
    if currentTime >= @_timing
      @y = @_dest
    else
      @y = @_dest + (@_timing - currentTime) * @_speed

  onTouchBegan : (touch, event)->
    return unless @_super touch, event
    @unscheduleUpdate()
    spawn = cc.spawn(
      cc.fadeOut 0.2
      cc.scaleBy 0.2, 1.5, 1.5
    )
    cb =-> @removeFromParent on
    seq = cc.sequence(
      spawn
      cc.CallFunc.create cb, this
    )
    @runAction seq

  onTouchMoved : (touch, event)->

  onTouchEnded : (touch, event)->

module.exports = Note
