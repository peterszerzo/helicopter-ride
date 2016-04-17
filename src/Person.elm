module Person where

import Html exposing (..)
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

import Constants exposing (updateTimeStep)
import Head
import Body

-- Model

type alias Model = {
  position: { x: Float, y: Float },
  head:
    { isLoose: Bool
    , x: Float
    , y: Float
    , vx: Float
    , vy: Float
    }
}

init : { x: Float, y: Float } -> Model
init pos =
  { position =
      { x = pos.x
      , y = pos.y
      }
  , head =
      { isLoose = True
      , x = 0
      , y = 0
      , vx = 0
      , vy = 0
      }
  }



-- Update

type Action = Update { x: Float, y: Float, vx: Float, vy: Float }

update: Action -> Model -> Model
update action model =
  case action of
    Update d ->
      let
        oldHead = model.head
        isHeadLoose = if (not oldHead.isLoose) then False else ((abs (model.position.x - d.x) > 25) || (abs (model.position.y - d.y) > 25))
        hasHeadJustComeLoose = (not oldHead.isLoose) && (isHeadLoose)
        vx = if (hasHeadJustComeLoose) then d.vx else oldHead.vx
        vy = if (hasHeadJustComeLoose) then d.vy else oldHead.vy
        x = oldHead.x + oldHead.vx * updateTimeStep
        y = oldHead.y + oldHead.vy * updateTimeStep
        newHead =
          { oldHead |
              isLoose = isHeadLoose
            , x = x
            , y = y
            , vx = vx
            , vy = vy
          }
      in
        { model |
          head = newHead
        }


-- View

view: Signal.Address Action -> Model -> Form
view address model =
  let
    baseTransform = move (model.position.x, model.position.y)
    headTransform = move (model.head.x, model.head.y)
    headShapes = List.map baseTransform (Head.view model.head)
    bodyShapes = List.map baseTransform (Body.view model.position)

    allShapes = List.concat [ headShapes, bodyShapes ]

  in
    (if model.head.isLoose then allShapes else bodyShapes)
      |> group
      |> rotate 3.14159
