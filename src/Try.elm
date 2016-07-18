module Try exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (program)
import Keyboard

type alias Model = String

type Msg = KeyUp Int | KeyDown Int

init = ("Hello!", Cmd.none)

update msg model =
  case msg of
    KeyDown code -> ("pressed " ++ (toString code), Cmd.none)
    KeyUp code -> ("released " ++ (toString code), Cmd.none)

subscriptions model =
  Sub.batch
  [ Keyboard.ups KeyUp
  , Keyboard.downs KeyDown
  ]

view model =
  span [] [text model]

main =
  program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }
