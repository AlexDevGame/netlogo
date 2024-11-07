turtles-own [consensus-heading]

to setup
  clear-all
  create-turtles 50 [
    setxy random-xcor random-ycor
    set heading random 360
  ]
  reset-ticks
end

to go
  ask turtles [
    let nearby-turtles other turtles in-radius 2
    if any? nearby-turtles [
      set consensus-heading mean [heading] of nearby-turtles
    ]
    set heading heading + 0.1 * (consensus-heading - heading)
  ]
  ask turtles [ fd 1 ]
  tick
end