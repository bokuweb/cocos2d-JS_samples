res = 
  noteImage : "res/note.png"
  destImage : "res/dest.png"  
  bgImage   : "res/bg.jpg"
  music     : "res/Ouroboros.mp3"
  
resources = []

resources.push v for k, v of res

module.exports =
  res : res
  resources : resources
