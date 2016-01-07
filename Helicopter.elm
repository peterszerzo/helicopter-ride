module Helicopter where

import Html exposing (..)

import Color exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

dt = 0.1

-- Model

type alias Model = { x: Float, y: Float, vx: Float, vy: Float }

init : Float -> Float -> Float -> Float -> Model
init x y vx vy = 
  { x = x, y = y, vx = vx, vy = vy }



-- Update

type Action = Move { x: Float, y: Float } | Tick | Accelerate { x: Float, y: Float }

update: Action -> Model -> Model
update action model = 
  case action of
    Move d ->
      { model | x = model.x + d.x, y = model.y + d.y }
    Accelerate d ->
      { model | vx = model.vx + d.x, vy = model.vy + d.y }
    Tick ->
      { model | x = model.x + model.vx * dt, y = model.y + model.vy * dt }



-- View

view: Signal.Address Action -> Model -> Form
view address model =
  let
    baseTransform = move (model.x, 55 + model.y)
  in
    [ path [ (-20,-20), (20,-20) ]
        |> traced (solid white)
        |> baseTransform
    , path [ (0,-13), (0,-20) ]
        |> traced (solid white)
        |> baseTransform
    , path [ (45,-14) ,(35,-14) ]
        |> traced (solid white)
        |> baseTransform
    , polygon [ (18,5), (-18,5), (-18,-13), (18,-13) ]
        |> filled (rgb 0 172 167)
        |> baseTransform
    , polygon [ (40,-5), (16,-5), (16,-3), (40,-3) ]
        |> filled (rgb 255 0 0)
        |> baseTransform
    , polygon [ (40,-5), (38,-5), (38,-14), (40,-14) ]
        |> filled (rgb 255 0 0)
        |> baseTransform
    , oval 24 22
        |> filled (rgb 0 195 0)
        |> move (-18, -2)
        |> baseTransform
    , oval 10 6
        |> filled (rgb 0 0 0)
        |> move (-18, -2)
        |> baseTransform
    ] 
      |> group
      |> rotate 3.14159 