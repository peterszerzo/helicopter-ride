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
    [ move (0 + model.x,55 + model.y) (traced (solid black) (path [ (-20,-20), (20,-20) ]))
    , move (0 + model.x,55 + model.y) (traced (solid black) (path [ (0,-13), (0,-20) ]))
    , move (0 + model.x,55 + model.y) (traced (solid black) (path [ (45,-14) ,(35,-14) ]))
    -- setfillstyle(1,3); setcolor(3);
    , move (0 + model.x,55 + model.y) (filled (rgb 0 172 167) (polygon [ (18,5), (-18,5), (-18,-13), (18,-13) ]))
    -- setfillstyle(1,4);
    , move (0 + model.x,55 + model.y) (filled (rgb 255 0 0) (polygon [ (40,-5), (16,-5), (16,-3), (40,-3) ]))
    , move (0 + model.x,55 + model.y) (filled (rgb 255 0 0) (polygon [ (40,-5), (38,-5), (38,-14), (40,-14) ]))
    -- 
    , move (-18 + model.x,-2 + 55 + model.y) (filled (rgb 0 195 0) (oval 24 22))
    , move (-18 + model.x,-2 + 55 + model.y) (filled (rgb 0 0 0) (oval 10 6))
  ])