turtles-own [vx vy]

to setup
  clear-all
  create-turtles 50 [
    setxy random-xcor random-ycor
    set vx random-float 1 - 0.5
    set vy random-float 1 - 0.5
  ]
  reset-ticks
end

to go
  ask turtles [
    flock
    move
    wrap-around
  ]
  tick
end

to flock
  let nearby-turtles other turtles in-radius 2
  if any? nearby-turtles [
    let avg-heading mean [heading] of nearby-turtles
    set heading avg-heading
  ]
end

to move
  set xcor xcor + vx
  set ycor ycor + vy
end

to wrap-around
  if xcor > max-pxcor [ set xcor min-pxcor ]
  if xcor < min-pxcor [ set xcor max-pxcor ]
  if ycor > max-pycor [ set ycor min-pycor ]
  if ycor < min-pycor [ set ycor max-pycor ]
end
