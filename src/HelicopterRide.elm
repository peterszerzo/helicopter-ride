module HelicopterRide exposing (..)

import Time exposing (..)
import AnimationFrame exposing (diffs)
import Html exposing (..)
import Color exposing (..)
import Html exposing (map)
import Html.Attributes exposing (style)
import Collage exposing (collage, rect, filled, solid)
import Element exposing (toHtml)
import Keyboard
import Markdown
import Constants exposing (canvasWidth, canvasHeight, personPositions, footerContent)
import Styles
import Helicopter.Views
import Helicopter.Update
import Helicopter.Models
import Person.Views
import Person.Update
import Person.Models


type alias Model =
    { helicopter : Helicopter.Models.Model
    , persons : List Person.Models.Model
    , direction : { x : Int, y : Int }
    , time : Float
    }


init : Float -> Float -> ( Model, Cmd Msg )
init helX helY =
    let
        helicopter =
            Helicopter.Models.init helX helY 0 2

        persons =
            List.map Person.Models.init personPositions

        direction =
            { x = 0, y = 0 }

        time =
            0
    in
        ( { helicopter = helicopter
          , persons = persons
          , direction = direction
          , time = time
          }
        , Cmd.none
        )


type Msg
    = KeyDown Int
    | KeyUp Int
    | Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyDown code ->
            let
                newX =
                    if code == 68 then
                        -1
                    else
                        (if code == 65 then
                            1
                         else
                            0
                        )

                newY =
                    if code == 87 then
                        -1
                    else
                        (if code == 83 then
                            1
                         else
                            0
                        )

                oldDirection =
                    model.direction

                newDirection =
                    { oldDirection | x = newX, y = newY }
            in
                ( { model | direction = newDirection }, Cmd.none )

        KeyUp code ->
            ( model, Cmd.none )

        Tick time ->
            ( { model
                | helicopter = Helicopter.Update.update model.direction model.helicopter
                , persons = List.map (Person.Update.update model.helicopter) model.persons
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.ups KeyUp
        , Keyboard.downs KeyDown
        , diffs Tick
        ]


view : Model -> Html Msg
view model =
    let
        rectangle =
            rect (canvasWidth |> toFloat) (canvasHeight |> toFloat) |> filled black

        helicopterView =
            Helicopter.Views.view model.helicopter

        personsView =
            List.map Person.Views.view model.persons

        graphicsElements =
            rectangle :: helicopterView :: personsView
    in
        div [ style Styles.container ]
            [ div [ style Styles.static ]
                [ Markdown.toHtml [] footerContent
                ]
            , div [ style Styles.canvasContainer ] [ toHtml (collage canvasWidth canvasHeight graphicsElements) ]
            ]
