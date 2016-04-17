module Head where

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)

view model =
  [ oval 16 20
      |> filled (rgb 255 255 0)
  , oval 2 2
      |> filled (rgb 0 0 0)
      |> move (-2, -3)
  , oval 2 2
      |> filled (rgb 0 0 0)
      |> move (2, -3)
  ]
