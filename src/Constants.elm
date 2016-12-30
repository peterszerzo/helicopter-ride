module Constants exposing (..)


canvasWidth : Int
canvasWidth =
    640


canvasHeight : Int
canvasHeight =
    480


frameRate =
    45


updateTimeStep =
    0.06


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

Happily nerded out by [@peterszerzo](https://github.com/peterszerzo), unable to contain his nostalgia on how simple coding used to be in high school.

Use the w-a-s-d keys to navigate the helicopter.
"""
