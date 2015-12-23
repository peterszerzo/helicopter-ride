--
-- Main application entry point
--

module HelicopterRide where

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)

import Helicopter
import Person

import Graphics.Collage exposing (collage, rect, filled, solid)

import Color exposing (..)

import Keyboard


-- Model

type alias Model =
  { helicopter: Helicopter.Model,
    person: Person.Model,
    time: Float
  }

init: Helicopter.Model -> Person.Model -> Float -> Model
init helicopterPosition personPosition time =
  { helicopter = Helicopter.init helicopterPosition,
    person = Person.init personPosition,
    time = time
  }


-- Update

type Action = Pers Person.Action | Heli Helicopter.Action | Move { x: Float, y: Float }

update: Action -> Model -> Model
update action model =
  case action of
    Heli act ->
      { model |
          helicopter = Helicopter.update act model.helicopter
      }
    Pers act ->
      { model |
          person = Person.update act model.person
      }
    Move d ->
      { model |
          helicopter = { x = model.helicopter.x + d.x, y = model.helicopter.y + d.y }
      }


-- View

containerStyle : Attribute
containerStyle = 
  style
    [ ("display", "block")
    , ("margin", "30px auto auto auto")
    , ("width", "640px")
    ]

view: Signal.Address Action -> Model -> Html
view address model =
  div [ containerStyle ]
    [ fromElement (
      collage 640 480
      [ (filled black) (rect 640 480)
      , Helicopter.view (Signal.forwardTo address Heli) model.helicopter 
      , Person.view (Signal.forwardTo address Pers) model.person
      ]
    )
    , button [ onClick address (Move { x = 5, y = 0 }) ] [ text "Move Left" ]
    , button [ onClick address (Move { x = -5, y = 0 }) ] [ text "Move Right" ]
    , button [ onClick address (Move { x = 0, y = 5 }) ] [ text "Move Down" ]
    , button [ onClick address (Move { x = 0, y = -5 }) ] [ text "Move Up" ]
    ]