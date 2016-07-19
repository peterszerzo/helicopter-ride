module Main exposing (..)

import Time exposing (..)
import Html.App as App

import HelicopterRide exposing (update, view, init, subscriptions)

main =
  App.program
  { init = init 10 10
  , update = update
  , view = view
  , subscriptions = subscriptions
  }
