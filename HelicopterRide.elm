--
-- Main application entry point
--

module HelicopterRide where

import Debug exposing (log)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)

import String
import Char

import Effects exposing (Effects, none)

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

init: Helicopter.Model -> Person.Model -> Float -> ( Model, Effects Action)
init helicopterPosition personPosition time =
  let 
    helicopter = Helicopter.init helicopterPosition
    person = Person.init personPosition
    time = time
  in
    ( { helicopter = helicopter
      , person = person
      , time = time
      }
      , none
    )


-- Update

type Action = Pers Person.Action | Heli Helicopter.Action | Move { x: Float, y: Float } | Tick | Key Char

update: Action -> Model -> ( Model, Effects Action)
update action model =
  case action of
    Heli act ->
      ( { model |
          helicopter = Helicopter.update act model.helicopter
      }, none )
    Pers act ->
      ( { model |
          person = Person.update act model.person
      }, none )
    Move d ->
      ( { model |
          helicopter = { x = model.helicopter.x + d.x, y = model.helicopter.y + d.y }
      }, none )
    Tick ->
      ({ model |
        helicopter = { x = model.helicopter.x, y = model.helicopter.y + 1 }
      }, none)
    Key keyCharacter ->
      let
        dx = 0
        dy = 0
      in  
        ({ model |
          helicopter = model.helicopter
        }, none)


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
    [ h1 [] [ text "Helicopter Ride" ]
    , fromElement (
        collage 640 480
        [ (filled black) (rect 640 480)
        , Helicopter.view (Signal.forwardTo address Heli) model.helicopter 
        , Person.view (Signal.forwardTo address Pers) model.person
        ]
      )
    , div [] 
    [ button [ onClick address (Move { x = 5, y = 0 }) ] [ text "Move Left" ]
    , button [ onClick address (Move { x = -5, y = 0 }) ] [ text "Move Right" ]
    , button [ onClick address (Move { x = 0, y = 5 }) ] [ text "Move Down" ]
    , button [ onClick address (Move { x = 0, y = -5 }) ] [ text "Move Up" ]
    ]
    ]