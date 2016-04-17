module Body where

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)

view model =
  [ path [ (-2, 4),(2, 4) ]
      |> traced (solid black)
  , oval 4 10
      |> filled (rgb 255 255 0)
      |> move (-14, 42)
  , oval 4 10
      |> filled (rgb 255 255 0)
      |> move (14, 42)
  , polygon [ (-12,15), (-16,15), (-16,42), (-12,42) ]
      |> filled (rgb 255 255 255)
  , polygon [ (12,15), (16,15), (16,42), (12,42) ]
      |> filled (rgb 255 255 255)
  , polygon [ (-10, 14), (-10, 45), (10, 45), (10, 14) ]
      |> filled (rgb 255 255 255)
  , polygon [ (-2, 7), (-2, 14), (2, 14), (2, 7) ]
      |> filled (rgb 255 255 255)
  , polygon [ (-9, 47), (-9, 81), (-2, 81), (-2, 47) ]
      |> filled (rgb 0 0 255)
  , polygon [ (9, 47), (9, 81), (2, 81), (2, 47) ]
      |> filled (rgb 0 0 255)
  , polygon [ (-9, 47), (-9, 53), (9, 53), (9, 47) ]
      |> filled (rgb 0 0 255)
  , path [ (-16, 38),(-12, 38) ]
      |> traced (solid black)
  , path [ (-16, 35),(-12, 35) ]
      |> traced (solid black)
  , path [ (16, 38),(12, 38) ]
      |> traced (solid black)
  , path [ (16, 35),(12, 35) ]
      |> traced (solid black)
  , path [ (-1, 14),(-4, 17) ]
      |> traced (solid black)
  , path [ (1, 14),(4, 17) ]
      |> traced (solid black)
  , path [ (-4, 17),(0, 22) ]
      |> traced (solid black)
  , path [ (4, 17),(0, 22) ]
      |> traced (solid black)
  , path [ (0, 22),(0, 45) ]
      |> traced (solid black)
  ]
