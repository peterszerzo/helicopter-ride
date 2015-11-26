module Helicopter where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- Model

type alias Model = String


-- Update

type Action = DoNothing | DoMoreNothing

update: Action -> Model -> Model
update action model = 
  case action of
    DoNothing ->
      model
    DoMoreNothing ->
      model


-- View

view: Signal.Address Action -> Model -> Html
view address model =
  span [ class "helicopter" ] [ text model ]