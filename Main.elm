import HelicopterRide exposing (update, view)
import StartApp.Simple exposing (start)

main = 
  start
    { model = { helicopter = 20 }
    , update = update
    , view = view
    }