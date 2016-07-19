module Helicopter.Update exposing (..)

import Constants exposing (canvasWidth, canvasHeight, updateTimeStep)

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
