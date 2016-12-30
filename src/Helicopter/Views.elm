module Helicopter.Views exposing (..)

import Color exposing (..)
import Collage exposing (..)


view model =
    let
        baseTransform =
            move ( model.x, model.y )

        orientation =
            if model.vx > 0 then
                -1
            else
                1
    in
        [ path [ ( -20 * orientation, -20 ), ( 20 * orientation, -20 ) ]
            |> traced (solid white)
            |> baseTransform
        , path [ ( 0 * orientation, -13 ), ( 0 * orientation, -20 ) ]
            |> traced (solid white)
            |> baseTransform
        , path [ ( 45 * orientation, -14 ), ( 35 * orientation, -14 ) ]
            |> traced (solid white)
            |> baseTransform
        , polygon [ ( 18 * orientation, 5 ), ( -18 * orientation, 5 ), ( -18 * orientation, -13 ), ( 18 * orientation, -13 ) ]
            |> filled (rgb 0 172 167)
            |> baseTransform
        , polygon [ ( 40 * orientation, -5 ), ( 16 * orientation, -5 ), ( 16 * orientation, -3 ), ( 40 * orientation, -3 ) ]
            |> filled (rgb 255 0 0)
            |> baseTransform
        , polygon [ ( 40 * orientation, -5 ), ( 38 * orientation, -5 ), ( 38 * orientation, -14 ), ( 40 * orientation, -14 ) ]
            |> filled (rgb 255 0 0)
            |> baseTransform
        , oval 24 22
            |> filled (rgb 0 195 0)
            |> move ( -18 * orientation, -2 )
            |> baseTransform
        , oval 10 6
            |> filled (rgb 0 0 0)
            |> move ( -18 * orientation, -2 )
            |> baseTransform
        ]
            |> group
            |> rotate 3.14159
