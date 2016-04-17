import HelicopterRide exposing (update, view, init)

import Time exposing (..)
import Keyboard

import StartApp exposing (..)

import Effects exposing (Never)
import Task

import Char


-- Input.

type alias Input = 
  { keyDirection: { x: Int, y: Int }
  , delta: Time
  }

delta : Signal Time
delta =
  Signal.map inSeconds (fps 35)

newInput : Signal Input
newInput = 
  Signal.sampleOn delta <|
    Signal.map2 Input
      Keyboard.wasd
      delta


-- Entry point.

app = 
  StartApp.start
    { init = init { x = 10, y = 10 }
    , update = update
    , view = view
    , inputs = [ 
      Signal.map (\info -> HelicopterRide.Step info) newInput
      ]
    }


main = 
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks