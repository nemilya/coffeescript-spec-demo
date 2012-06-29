{Ball} = require('../lib/ball')

describe "describe Ball", ->
  it "defined", ->
    expect(Ball).toBeDefined()

  it "название и координаты", ->
    ball = new Ball "name", [1,2]
    expect(ball.name).toEqual "name"
    expect(ball.x()).toEqual 1
    expect(ball.y()).toEqual 2

  it "передвижение вправо", ->
    start_point = [1,3]
    right_point = [2,3]
    ball = new Ball "name", start_point
    ball.move_right()
    expect(ball.position).toEqual right_point
