class Ball
  constructor: (@name, @position) ->

  x: ->
    @position[0]

  y: ->
    @position[1]

  move_right: ->
    @position[0] += 1
    

exports.Ball = Ball