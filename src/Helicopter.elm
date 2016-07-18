module Helicopter exposing (..)

import Html exposing (..)
import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)

import Constants exposing (canvasWidth, canvasHeight, updateTimeStep)


-- Model

type alias Model =
  { x : Float
  , y : Float
  , vx : Float
  , vy : Float }

init : Float -> Float -> Float -> Float -> Model
init x y vx vy =
  Model x y vx vy


update dir model =
  let
    x = model.x + model.vx * updateTimeStep
    y = model.y + model.vy * updateTimeStep
    fx = if (x < -canvasWidth/2 || x > canvasWidth/2) then -1 else 1
    fy = if (y < -canvasHeight/2 || y > canvasHeight/2) then -1 else 1
    vx = (model.vx + (toFloat dir.x)) * fx
    vy = (model.vy + (toFloat dir.y)) * fy
  in
    { model |
        vx = vx
      , vy = vy
      , x = x
      , y = y
    }



-- View

view model =
  let
    baseTransform = move (model.x, model.y)
    orientation = if model.vx > 0 then -1 else 1
  in
    [ path [ (-20 * orientation, -20), (20 * orientation,-20) ]
        |> traced (solid white)
        |> baseTransform
    , path [ (0 * orientation,-13), (0 * orientation,-20) ]
        |> traced (solid white)
        |> baseTransform
    , path [ (45 * orientation, -14) ,(35 * orientation,-14) ]
        |> traced (solid white)
        |> baseTransform
    , polygon [ (18 * orientation,5), (-18 * orientation,5), (-18 * orientation,-13), (18 * orientation,-13) ]
        |> filled (rgb 0 172 167)
        |> baseTransform
    , polygon [ (40 * orientation,-5), (16 * orientation,-5), (16 * orientation,-3), (40 * orientation,-3) ]
        |> filled (rgb 255 0 0)
        |> baseTransform
    , polygon [ (40 * orientation,-5), (38 * orientation,-5), (38 * orientation,-14), (40 * orientation,-14) ]
        |> filled (rgb 255 0 0)
        |> baseTransform
    , oval 24 22
        |> filled (rgb 0 195 0)
        |> move (-18 * orientation, -2)
        |> baseTransform
    , oval 10 6
        |> filled (rgb 0 0 0)
        |> move (-18 * orientation, -2)
        |> baseTransform
    ]
      |> group
      |> rotate 3.14159
