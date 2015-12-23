import HelicopterRide exposing (update, view)

import Time exposing (..)
import Keyboard

import StartApp.Simple exposing (start)

-- Copied from StartApp.Simple for experimentation

--import Debug
--import Html exposing (Html)
--import Signal exposing (Address)

--type alias Config model action =
--    { model : model
--    , view : Address action -> model -> Html
--    , update : action -> model -> model
--    }

--start : Config model action -> Signal Html
--start config =
--  let
--    actions =
--      Signal.mailbox Nothing

--    address =
--      Signal.forwardTo actions.address Just

--    update maybeAction model =
--      case maybeAction of
--        Just action ->
--            config.update action model

--        Nothing ->
--            Debug.crash "This should never happen."

--    model =
--      Signal.foldp update config.model actions.signal
--  in
--    Signal.map (config.view address) model


-- Entry point.

main = 
  start
    { model = { person = { x = 10, y = 10 }, helicopter = { x = 20, y = 10 }, time = 0 }
    , update = update
    , view = view
    }