module Constants exposing (..)


canvasWidth : Int
canvasWidth =
    640


canvasHeight : Int
canvasHeight =
    480


updateTimeStep : Float
updateTimeStep =
    0.06


personPositions : List { x : Float, y : Float }
personPositions =
    [ { x = 30, y = 10 }
    , { x = 50, y = -20 }
    , { x = 10, y = -160 }
    , { x = 80, y = 100 }
    , { x = 200, y = -100 }
    , { x = -290, y = -130 }
    , { x = -250, y = 140 }
    , { x = -200, y = -100 }
    ]


footerContent : String
footerContent =
    """
# Helicopter Ride

This silly macabre game is my second ever game, originally written in Pascal around 2004 and re-created as my first ever Elm app in late 2015. Sometimes it is difficult to contain my nostalgia around how simple programming used to be in high school.

Anyways, use the w-a-s-d keys to navigate the helicopter.
"""
