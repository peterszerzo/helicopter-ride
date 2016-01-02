module Person (Model, init, Action, update, view) where

import Html exposing (..)

import Color exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)


-- Model

type alias Model = { x: Float, y: Float }

init : { x: Float, y: Float } -> Model
init pos = 
  { x = pos.x, y = pos.y }



-- Update

type Action = Move (Float, Float)

update: Action -> Model -> Model
update action model =
  case action of
    Move (dx, dy) ->
      { x = model.x + dx, y = model.y + dy }


-- View

view: Signal.Address Action -> Model -> Form
view address model =
  rotate 3.14159 (group
    [ 
    move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (-16, 38),(-12, 38) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (-16, 35),(-12, 35) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (16, 38),(12, 38) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (16, 35),(12, 35) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (-1, 14),(-4, 17) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (1, 14),(4, 17) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (-4, 17),(0, 22) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (4, 17),(0, 22) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid white) (path [ (0, 22),(0, 45) ] ))
  ])