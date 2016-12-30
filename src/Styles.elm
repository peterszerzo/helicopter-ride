module Styles exposing (..)


type alias Styl =
    List ( String, String )


container : Styl
container =
    [ ( "display", "block" )
    , ( "margin", "30px auto auto auto" )
    , ( "width", "640px" )
    ]


static : Styl
static =
    [ ( "font-family", "Courier New, monospace" )
    , ( "text-align", "center" )
    , ( "margin", "80px 0 40px" )
    ]


canvasContainer : Styl
canvasContainer =
    [ ( "box-shadow", "0 0 15px 0 rgba(0, 0, 0, .5)" )
    , ( "border-radius", "6px" )
    , ( "overflow", "hidden" )
    ]
