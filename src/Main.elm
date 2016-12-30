module Main exposing (..)

import Html
import HelicopterRide exposing (update, view, init, subscriptions)


main : Program Never HelicopterRide.Model HelicopterRide.Msg
main =
    Html.program
        { init = HelicopterRide.init 10 10
        , update = HelicopterRide.update
        , view = HelicopterRide.view
        , subscriptions = HelicopterRide.subscriptions
        }
