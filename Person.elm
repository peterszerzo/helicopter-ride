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
    [ move (-14 + model.x, 42 + model.y) (filled (rgb 255 255 0) (oval 4 10))
    , move (14 + model.x, 42 + model.y) (filled (rgb 255 255 0) (oval 4 10))

    , move (0 + model.x, 0 + model.y) (filled (rgb 255 255 0) (oval 16 20))
    , move (-2 + model.x, -3 + model.y) (filled (rgb 0 0 0) (oval 2 2))
    , move (2 + model.x, -3 + model.y) (filled (rgb 0 0 0) (oval 2 2))

    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (-2, 4),(2, 4) ] ))

    , move (0 + model.x,  0 + model.y) (filled (rgb 255 255 255) (polygon [ (-12,15), (-16,15), (-16,42), (-12,42) ]))
    , move (0 + model.x,  0 + model.y) (filled (rgb 255 255 255) (polygon [ (12,15), (16,15), (16,42), (12,42) ]))
    , move (0 + model.x,  0 + model.y) (filled (rgb 255 255 255) (polygon [ (-10, 14), (-10, 45), (10, 45), (10, 14) ]))
    , move (0 + model.x,  0 + model.y) (filled (rgb 255 255 255) (polygon [ (-2, 7), (-2, 14), (2, 14), (2, 7) ]))

    , move (0 + model.x,  0 + model.y) (filled (rgb 0 0 255) (polygon [ (-9, 47), (-9, 81), (-2, 81), (-2, 47) ]))
    , move (0 + model.x,  0 + model.y) (filled (rgb 0 0 255) (polygon [ (9, 47), (9, 81), (2, 81), (2, 47) ]))
    , move (0 + model.x,  0 + model.y) (filled (rgb 0 0 255) (polygon [ (-9, 47), (-9, 53), (9, 53), (9, 47) ]))
    
    , move (0 + model.x,  0 + model.y) (traced   (solid black) (path [ (-16, 38),(-12, 38) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (-16, 35),(-12, 35) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (16, 38),(12, 38) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (16, 35),(12, 35) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (-1, 14),(-4, 17) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (1, 14),(4, 17) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (-4, 17),(0, 22) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (4, 17),(0, 22) ] ))
    , move (0 + model.x,  0 + model.y) (traced (solid black) (path [ (0, 22),(0, 45) ] ))
    
  ])