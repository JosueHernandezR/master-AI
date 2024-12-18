(define (domain rover-domain)
  (:requirements :strips :typing)
  (:types
    location rover rock
  )
  
  (:predicates
    (at ?r - rover ?l - location) ; El rover está en una ubicación
    (rock-at ?rock - rock ?l - location) ; Una roca está en una ubicación
    (carrying ?r - rover ?rock - rock) ; El rover está llevando una roca
    (connected ?l1 - location ?l2 - location) ; Dos localidades están conectadas
  )

  (:action move
    :parameters (?r - rover ?from - location ?to - location)
    :precondition (and (at ?r ?from) (connected ?from ?to))
    :effect (and (at ?r ?to) (not (at ?r ?from)))
  )

  (:action pick-up
    :parameters (?r - rover ?rock - rock ?l - location)
    :precondition (and (at ?r ?l) (rock-at ?rock ?l) (not (carrying ?r ?rock)))
    :effect (and (carrying ?r ?rock) (not (rock-at ?rock ?l)))
  )

  (:action drop
    :parameters (?r - rover ?rock - rock ?l - location)
    :precondition (and (at ?r ?l) (carrying ?r ?rock))
    :effect (and (rock-at ?rock ?l) (not (carrying ?r ?rock)))
  )
)