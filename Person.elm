module Person where

import Html exposing (..)

import Color exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)


-- Model

type alias Model = { 
  position: { x: Float, y: Float },
  hasHead: Bool
}

init : { x: Float, y: Float } -> Model
init pos = 
  { position = { x = pos.x, y = pos.y }
  , hasHead = True
  }



-- Update

type Action = Update { x: Float, y: Float }

update: Action -> Model -> Model
update action model =
  case action of
    Update d ->
      let
        hasHead = if (not model.hasHead) then False else ((abs (model.position.x - d.x) > 25) || (abs (model.position.y - d.y) > 25))
      in
        { model | 
          hasHead = hasHead
        }


-- View

view: Signal.Address Action -> Model -> Form
view address model =
  let
    baseTransform = move (model.position.x, model.position.y)

    head = [
      oval 4 10
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
    ]

    rest = [ path [ (-2, 4),(2, 4) ]
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

    all = List.concat [ head, rest ]

  in
    (if model.hasHead then all else rest)
      |> group
      |> rotate 3.14159 