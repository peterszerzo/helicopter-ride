module Helicopter.Models exposing (..)


type alias Model =
    { x : Float
    , y : Float
    , vx : Float
    , vy : Float
    }


init : Float -> Float -> Float -> Float -> Model
init x y vx vy =
    Model x y vx vy
