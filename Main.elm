import HelicopterRide exposing (update, view, init)

import Time exposing (..)
import Keyboard

import StartApp exposing (..)

import Effects exposing (Never)
import Task

import Char


-- Entry point.

app = 
  StartApp.start
    { init = init { x = 10, y = 10 } { x = 20, y = 10 } 0
    , update = update
    , view = view
    , inputs = [ 
        Signal.map (\n -> HelicopterRide.Tick) (fps 60)
      , Signal.map (\i -> HelicopterRide.Key (Char.fromCode i)) Keyboard.presses
      ]
    }


main = 
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks