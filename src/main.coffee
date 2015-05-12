res = require('./resource').res
resources = require('./resource').resources

cc.game.onStart = ->
  AppScene = require './app'
  if not cc.sys.isNative and document.getElementById "cocosLoading"
    document.body.removeChild(document.getElementById "cocosLoading")

  cc.view.enableRetina off
  cc.view.adjustViewPort on
  cc.view.setDesignResolutionSize 320, 480, cc.ResolutionPolicy.SHOW_ALL
  cc.director.setContentScaleFactor 2
  cc.view.resizeWithBrowserSize on
  cc.LoaderScene.preload resources, ->
    cc.director.runScene new AppScene()
  , this

cc.game.run()
