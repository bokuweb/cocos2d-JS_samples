res = 
  testImage : "res/test.png"
  bgImage   : "res/bg.jpg" 

resources = []

resources.push v for k, v of res

module.exports =
  res : res
  resources : resources
