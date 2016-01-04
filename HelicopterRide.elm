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

import Helicopter exposing (update, view, init)
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

init: { x: Float, y: Float } -> Person.Model -> Float -> ( Model, Effects Action)
init helicopterPosition personPosition time =
  let 
    helicopter = Helicopter.init helicopterPosition.x helicopterPosition.y 0 2
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

getAcceleration: Char -> { x: Float, y: Float }
getAcceleration char =
  if (char == 'w') then 
    { x = 0, y = -1 } 
  else if (char == 's') then 
    { x = 0, y = 1 } 
  else if (char == 'a') then 
    { x = 1, y = 0 } 
  else if (char == 'd') then 
    { x = -1, y = 0 } 
  else 
    { x = 0, y = 0 }

type Action = Pers Person.Action | Heli Helicopter.Action | Tick | Key Char

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
    Tick ->
      ({ model |
        helicopter = Helicopter.update Helicopter.Tick model.helicopter
      }, none)
    Key keyChar ->
      let
        key = String.fromChar keyChar
        acceleration = getAcceleration keyChar
      in  
        ({ model |
          helicopter = Helicopter.update (Helicopter.Accelerate (getAcceleration keyChar)) model.helicopter
        }, none)


-- View

containerStyle : Attribute
containerStyle = 
  style
    [ ("display", "block")
    , ("margin", "30px auto auto auto")
    , ("width", "640px")
    ]

headingStyle : Attribute
headingStyle =
  style
    [ ("font-family", "calibri, helvetica")
    ]

view: Signal.Address Action -> Model -> Html
view address model =
  div [ containerStyle ]
    [ h1 [ headingStyle ] [ text "Helicopter Ride" ]
    , p [] [ text "Use w-a-s-d keys to navigate the helicopter." ]
    , fromElement (
        collage 640 480
        [ (filled black) (rect 640 480)
        , Person.view (Signal.forwardTo address Pers) model.person
        , Helicopter.view (Signal.forwardTo address Heli) model.helicopter 
        ]
      )
    --, div [] 
    --[ button [ onClick (Signal.forwardTo address Heli) (Helicopter.Move { x = 5, y = 0 }) ] [ text "Move Left" ]
    --, button [ onClick (Signal.forwardTo address Heli) (Helicopter.Move { x = -5, y = 0 }) ] [ text "Move Right" ]
    --, button [ onClick (Signal.forwardTo address Heli) (Helicopter.Move { x = 0, y = 5 }) ] [ text "Move Down" ]
    --, button [ onClick (Signal.forwardTo address Heli) (Helicopter.Move { x = 0, y = -5 }) ] [ text "Move Up" ]
    --]
    ]