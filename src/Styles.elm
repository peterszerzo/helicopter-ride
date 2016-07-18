module Styles exposing (..)

import Html.Attributes exposing (style)

container =
  style
  [ ("display", "block")
  , ("margin", "30px auto auto auto")
  , ("width", "640px")
  ]

textBar =
  style
  [ ("margin", "80px 0 40px")
  ]

heading =
  style
  [ ("font-family", "Courier New, monospace")
  , ("text-align", "center")
  ]

paragraph =
  style
  [ ("font-family", "Courier New, monospace")
  ]

canvasContainer =
  style
  [ ("box-shadow", "0 0 15px 0 rgba(0, 0, 0, .5)")
  , ("border-radius", "6px")
  , ("overflow", "hidden")
  ]
