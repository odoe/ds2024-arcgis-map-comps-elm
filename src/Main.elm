port module Main exposing (main)

import Browser
import HelloWorld exposing (helloWorld)
import Html exposing (Html, div, img, text, h1, node)
import Html.Events exposing (on)
import Html.Attributes exposing (src, style, attribute)
import Msg exposing (Msg(..))
import Json.Decode as Decode
import VitePluginHelper

type alias Model =
    { mapReady : Bool
    }

main : Program () Model Msg
main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

port sendMapReady : Bool -> Cmd msg

init : () -> ( Model, Cmd Msg )
init flags =
  ( { mapReady = False }
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        MapReady ->
            ( { model | mapReady = True}
            , sendMapReady True
              )

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

onArcgisViewReadyChange : msg -> Html.Attribute msg
onArcgisViewReadyChange message =
  on "arcgisViewReadyChange" (Decode.succeed message)

view : Model -> Html Msg
view model =
    div [ style "height" "100%" ]
        [ div [ style "height" "400px"]
        [
            node "arcgis-map"
            [ attribute "item-id" "d5dda743788a4b0688fe48f43ae7beb9"
            , onArcgisViewReadyChange MapReady][]
            ]
        , helloWorld model.mapReady
        ]
