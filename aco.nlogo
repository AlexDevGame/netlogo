patches-own [pheromone]
turtles-own [carrying-food?]

to setup
  clear-all
  ask patches [ set pheromone 0 ]
  create-turtles 50 [
    setxy random-xcor random-ycor
    set carrying-food? false
  ]
  ask n-of 5 patches [ set pcolor green ] ; representa alimentos
  reset-ticks
end

to go
  ask turtles [
    ifelse carrying-food?
      [ return-to-nest ]
      [ search-for-food ]
  ]
  diffuse pheromone 0.5
  tick
end

to search-for-food
  let food-here any? patches with [pcolor = green]
  if food-here [
    set pcolor black
    set carrying-food? true
  ]
  else [
    wander
    follow-pheromone
  ]
end

to return-to-nest
  set pheromone pheromone + 1
  if distancexy 0 0 < 1 [
    set carrying-food? false
  ]
  move-towards 0 0
end

to wander
  rt random 40 - 20
  fd 1
end

to follow-pheromone
  let strongest-pheromone max-one-of neighbors [pheromone]
  if [pheromone] of strongest-pheromone > 0 [
    face strongest-pheromone
  ]
end