import Helicopter exposing (update, view)
import StartApp.Simple exposing (start)

main = 
  start
    { model = "Welcome to the Helicopter Ride"
    , update = update
    , view = view
    }