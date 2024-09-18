(define (problem complex-rover-problem)
    (:domain rover-domain)

    (:objects
        rover1 rover2 - rover
        rock1 rock2 rock3 - rock
        L1 L2 L3 L4 L5 L6 - location
    )

    (:init
        (at rover1 L4) ; rover1 starts at location L4
        (at rover2 L3) ; rover2 starts at location L3
        (rock-at rock1 L1) ; rock1 is at location L1
        (rock-at rock2 L2) ; rock2 is at location L2
        (rock-at rock3 L5) ; rock3 is at location L5
        (connected L1 L3) ; L1 is connected to L3
        (connected L3 L1) ; L3 is connected to L1 (bidirectional)
        (connected L3 L2) ; L3 is connected to L2
        (connected L2 L4) ; L2 is connected to L4
        (connected L4 L5) ; L4 is connected to L5 (bidirectional)
        (connected L5 L4) ; L5 is connected to L4 (bidirectional)
        (connected L4 L6) ; L4 is connected to L6
    )

    (:goal
        (and
            (rock-at rock1 L6) ; rock1 should be delivered to L6
            (rock-at rock2 L6) ; rock2 should be delivered to L6
            (rock-at rock3 L6) ; rock3 should be delivered to L6
        )
    )
)