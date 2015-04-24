Damage = cc.Layer.extend
  ctor : ->
    @_super()

  show : (num)->
    size = cc.director.getWinSize()
    digits = @_getDigits num
    console.log digits
    for i in [0...digits]
      label = new cc.LabelTTF "", "Arial", 48
      label.attr
        opacity : 0
        x : i * -32 + (32 * digits / 2)
      cb = -> @removeFromParent on
      move = cc.moveBy 0.15, 0, 25
      seq = cc.sequence(
        cc.delayTime((digits - i) * 0.10)
        cc.spawn(
          cc.fadeIn 0.3
          cc.sequence(move, move.reverse())
        )
        cc.fadeOut 0.15
        cc.delayTime 0.3
        cc.CallFunc.create cb, this
      )
      label.setString(~~(num % 10))
      num /= 10
      @addChild label
      label.runAction seq

  _getDigits : (num)-> Math.log(num) / Math.log(10) + 1 | 0

module.exports = Damage
