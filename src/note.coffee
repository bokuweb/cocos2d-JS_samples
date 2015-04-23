TouchSprite = require './touchSprite'

Note = TouchSprite.extend

  ctor : (texture)->
    @_super texture

  start : ->
    @scheduleUpdate()

  update : ->
    @y -= 1

  onTouchBegan : (touch, event)->
    return unless @_super touch, event

module.exports = Note
