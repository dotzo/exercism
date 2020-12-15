module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = (secondsToYears seconds) / (orbitalPeriod planet)

orbitalPeriod :: Planet -> Float
orbitalPeriod Mercury = 0.2408467
orbitalPeriod Venus = 0.61519726 
orbitalPeriod Earth = 1.0
orbitalPeriod Mars = 1.8808158
orbitalPeriod Jupiter = 11.862615
orbitalPeriod Saturn = 29.447498 
orbitalPeriod Uranus = 84.016846 
orbitalPeriod Neptune = 164.79132

secondsToYears :: Float -> Float
secondsToYears = (/31557600)