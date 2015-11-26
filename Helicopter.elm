module Helicopter (Model, init, Action, update, view) where

import Html exposing (..)

import Color exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)



-- Model

type alias Model = Float

init : Float -> Model
init pos = pos



-- Update

type Action = MoveUp | MoveDown

update: Action -> Model -> Model
update action model = 
  case action of
    MoveUp ->
      model + 5
    MoveDown ->
      model - 5



-- View

view: Signal.Address Action -> Model -> Html
view address model =
  fromElement (
    collage 200 420
      [ move (0,55 + model) (traced (solid black) ln1)
      , move (0,55 + model) (traced (solid black) ln2)
      , move (0,55 + model) (traced (solid black) ln3)
      , move (0,55 + model) (traced (solid blue) pth1)
      , move (0,55 + model) (traced (solid yellow) pth2)
      , move (0,55 + model) (traced (solid yellow) pth3)
      ]
  )

-- setcolor(15);
ln1 : Path
ln1 =
  path [ (-20,-20), (20,-20) ]

ln2 : Path
ln2 =
  path [ (0,-13), (0,-20) ]

ln3: Path
ln3 =
  path [ (45,-14) ,(35,-14) ]


-- setfillstyle(1,3); setcolor(3);
pth1 : Path
pth1 =
  path [ (18,5), (-18,5), (-18,-13), (18,-13), (18,5) ]


-- setfillstyle(1,4);
pth2: Path
pth2 =
  path [ (40,-5), (16,-5), (16,-3), (40,-3), (40,-5) ]

pth3: Path
pth3 =
  path [ (40,-5), (38,-5), (38,-14), (40,-14), (40,-5) ]