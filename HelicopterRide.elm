--
-- Main application entry point
--

module HelicopterRide where

import Html exposing (..)
import Html.Events exposing (..)

import Helicopter



-- Model

type alias Model =
  { helicopter: Helicopter.Model
  }

init: Float -> Model
init pos =
  { helicopter = Helicopter.init pos
  }



-- Update

type Action = Heli Helicopter.Action | MoveUp | MoveDown

update: Action -> Model -> Model
update action model =
  case action of
    Heli act ->
      { model |
          helicopter = Helicopter.update act model.helicopter
      }
    MoveUp ->
      { model |
          helicopter = model.helicopter + 5
      }
    MoveDown ->
      { model |
          helicopter = model.helicopter - 5
      }



-- View

view: Signal.Address Action -> Model -> Html
view address model =
  div []
    [ Helicopter.view (Signal.forwardTo address Heli) model.helicopter 
    , button [ onClick address MoveUp ] [ text "Move Up" ]
    , button [ onClick address MoveDown ] [ text "Move Down" ]
    ]