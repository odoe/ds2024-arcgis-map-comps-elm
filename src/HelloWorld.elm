module HelloWorld exposing (helloWorld)

import Html exposing (Html, a, button, code, div, h1, p, text, h2)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Msg exposing (Msg(..))

stringFromBool : Bool -> String
stringFromBool value =
  if value then
    "Yes"

  else
    "No"

helloWorld : Bool -> Html Msg
helloWorld model =
    div []
        [ h1 [] [ text "ArcGIS, Vite + Elm!" ]
        , p []
            [ a [ href "https://vitejs.dev/guide/features.html" ] [ text "Vite Documentation" ]
            , text " | "
            , a [ href "https://guide.elm-lang.org/" ] [ text "Elm Documentation" ]
            ]
        , p []
            [ text "Edit "
            , code [] [ text "src/Main.elm" ]
            , text " to test auto refresh"
            ]
        , h2 []
            [ text "Map is ready: "
            , text (stringFromBool model)
            ]
        ]
