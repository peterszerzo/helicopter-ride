module Person.Models exposing (..)

type alias Model =
  { position: { x: Float, y: Float }
  , head:
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
