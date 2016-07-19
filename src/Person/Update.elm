module Person.Update exposing (..)

import Constants exposing (updateTimeStep)

update hel model =
  let
    oldHead = model.head
    isHeadLoose = if (not oldHead.isLoose) then False else ((abs (model.position.x - hel.x) > 25) || (abs (model.position.y - hel.y) > 25))
    hasHeadJustComeLoose = (not oldHead.isLoose) && (isHeadLoose)
    vx = if (hasHeadJustComeLoose) then hel.vx else oldHead.vx
    vy = if (hasHeadJustComeLoose) then hel.vy else oldHead.vy
    x = oldHead.x + oldHead.vx * updateTimeStep
    y = oldHead.y + oldHead.vy * updateTimeStep
    newHead =
      { oldHead |
          isLoose = isHeadLoose
        , x = x
        , y = y
        , vx = vx
        , vy = vy
      }
  in
    {model | head = newHead}
