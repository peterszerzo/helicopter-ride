--
-- Main application entry point
--

module HelicopterRide where

import Time exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)

import Effects exposing (Effects, none)

import Constants exposing (canvasWidth, canvasHeight, personPositions)

import Helicopter exposing (update, view, init)
import Person

import Graphics.Collage exposing (collage, rect, filled, solid)

import Color exposing (..)

import Keyboard


-- Model

type alias Model =
  { helicopter: Helicopter.Model
  , persons: List Person.Model
  , time: Float
  }

init: { x: Float, y: Float } -> ( Model, Effects Action)
init helicopterPosition =
  let
    helicopter = Helicopter.init helicopterPosition.x helicopterPosition.y 0 2
    persons = List.map Person.init personPositions
    time = 0
  in
    ( { helicopter = helicopter
      , persons = persons
      , time = time
      }
      , none
    )


-- Update

type Action = PersonAction Person.Action | HelicopterAction Helicopter.Action | Step { keyDirection: { x: Int, y: Int }, delta: Time }

update: Action -> Model -> ( Model, Effects Action)
update action model =
  case action of
    HelicopterAction act ->
      ( { model |
          helicopter = Helicopter.update act model.helicopter
      }, none )
    PersonAction act ->
      ( { model |
          persons = List.map (Person.update act) model.persons
      }, none )
    Step info ->
      let
        keyDirectionFloat = { x = toFloat -info.keyDirection.x, y = toFloat -info.keyDirection.y }
        helicopterPosition =
          { x = model.helicopter.x
          , y = model.helicopter.y
          , vx = model.helicopter.vx
          , vy = model.helicopter.vy
          }
      in
        ({ model |
            helicopter = Helicopter.update (Helicopter.Update keyDirectionFloat) model.helicopter
          , persons = List.map (Person.update (Person.Update helicopterPosition)) model.persons
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
  let
    rectangle = rect canvasWidth canvasHeight |> filled black
    helicopterView = Helicopter.view (Signal.forwardTo address HelicopterAction) model.helicopter
    personsView = List.map (Person.view (Signal.forwardTo address PersonAction)) model.persons
    graphicsElements = rectangle :: helicopterView :: personsView
  in
    div [ containerStyle ]
      [ h1 [ headingStyle ] [ text "Helicopter Ride" ]
      , p [] [ text "Use the w-a-s-d keys to navigate the helicopter." ]
      , fromElement (
          collage canvasWidth canvasHeight graphicsElements
        )
      ]
