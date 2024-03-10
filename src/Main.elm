module Main exposing (main)

import Browser
import HelloWorld exposing (helloWorld)
import Html exposing (Html, div, img, text, h1, node)
import Html.Attributes exposing (src, style, attribute)
import Msg exposing (Msg(..))
import VitePluginHelper

main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view }

-- port sendMapReady : number -> Cmd msg

update : Msg -> number -> number
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        -- MapReady ->
        --     sendMapReady 1

view : Int -> Html Msg
view model =
    div [ style "height" "100%" ]
        [ div [ style "height" "400px"]
        [
            node "arcgis-map"
            [ attribute "item-id" "d5dda743788a4b0688fe48f43ae7beb9" ][]
            ]
        , helloWorld model
        ]
