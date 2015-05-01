res = 
  textureImage : "res/particle_texture.png"
  texturePlist : "res/particle_texture.plist"

resources = []

resources.push v for k, v of res

module.exports =
  res : res
  resources : resources
