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
  let
    baseTransform = move (model.x, model.y)
  in
    [ oval 4 10
        |> filled (rgb 255 255 0)
        |> baseTransform
        |> move (-14, 42)
    , oval 4 10
        |> filled (rgb 255 255 0)
        |> baseTransform
        |> move (14, 42)
    , oval 16 20
        |> filled (rgb 255 255 0)
        |> baseTransform
    , oval 2 2
        |> filled (rgb 0 0 0)
        |> baseTransform
        |> move (-2, -3)
    , oval 2 2
        |> filled (rgb 0 0 0) 
        |> baseTransform
        |> move (2, -3)
    , path [ (-2, 4),(2, 4) ]
        |> traced (solid black)
        |> baseTransform
    , polygon [ (-12,15), (-16,15), (-16,42), (-12,42) ]
        |> filled (rgb 255 255 255)
        |> baseTransform 
    , polygon [ (12,15), (16,15), (16,42), (12,42) ]
        |> filled (rgb 255 255 255)
        |> baseTransform 
    , polygon [ (-10, 14), (-10, 45), (10, 45), (10, 14) ]
        |> filled (rgb 255 255 255)
        |> baseTransform 
    , polygon [ (-2, 7), (-2, 14), (2, 14), (2, 7) ]
        |> filled (rgb 255 255 255)
        |> baseTransform 
    , polygon [ (-9, 47), (-9, 81), (-2, 81), (-2, 47) ]
        |> filled (rgb 0 0 255) 
        |> baseTransform
    , polygon [ (9, 47), (9, 81), (2, 81), (2, 47) ]
        |> filled (rgb 0 0 255) 
        |> baseTransform
    , polygon [ (-9, 47), (-9, 53), (9, 53), (9, 47) ]
        |> filled (rgb 0 0 255) 
        |> baseTransform
    , path [ (-16, 38),(-12, 38) ]
        |> traced (solid black)
        |> baseTransform
    , path [ (-16, 35),(-12, 35) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (16, 38),(12, 38) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (16, 35),(12, 35) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (-1, 14),(-4, 17) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (1, 14),(4, 17) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (-4, 17),(0, 22) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (4, 17),(0, 22) ]
        |> traced (solid black)    
        |> baseTransform 
    , path [ (0, 22),(0, 45) ]
        |> traced (solid black)    
        |> baseTransform 
    ]
      |> group
      |> rotate 3.14159 