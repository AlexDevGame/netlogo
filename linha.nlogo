turtles-own [target-x]

to setup
  clear-all
  create-turtles 20 [
    setxy random-xcor random-ycor
    set target-x 0
  ]
  reset-ticks
end

to go
  ask turtles [
    let left-turtle min-one-of (other turtles with [xcor < [xcor] of myself]) [xcor]
    if left-turtle != nobody [
      set target-x ([xcor] of left-turtle) + 1
      set xcor xcor + 0.1 * (target-x - xcor)
    ]
  ]
  tick
end