(define (problem rover-problem)
  (:domain rover-domain)
  (:objects
    rover1 - rover
    rock1 rock2 - rock
    loc1 loc2 loc3 loc4 loc5 - location
  )
  
  (:init
    (at rover1 loc3)
    (rock-at rock1 loc1)
    (rock-at rock2 loc2)
    (connected loc3 loc1)
    (connected loc1 loc3) ; bidireccional
    (connected loc3 loc2)
    (connected loc2 loc4)
    (connected loc3 loc4)
    (connected loc4 loc3)
    (connected loc4 loc5)
    (connected loc5 loc4) ; bidireccional
  )

  (:goal
    (and
      (rock-at rock1 loc5)
      (rock-at rock2 loc5)
    )
  )
)