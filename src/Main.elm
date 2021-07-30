module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Events as Evt
import Html.Attributes as Attr
import Json.Decode as D
import Json.Encode as E

type Msg = NoOp

type alias Model =
    { useragent    : String
    , platform     : String
    , ipaddr       : String
    , resolut      : String
    , depth        : Int
    , langs        : String
    }

flagsDecoder : D.Decoder Model
flagsDecoder =
    D.map6 Model
        (D.field "useragent" D.string)
        (D.field "platform"  D.string)
        (D.field "ipaddr"    D.string)
        (D.field "resolut"   D.string)
        (D.field "depth"     D.int)
        (D.field "langs"     D.string)

init : E.Value -> ( Model, Cmd Msg )
init flags =
    (
        case D.decodeValue flagsDecoder flags of
            Ok model -> model
            Err _ -> { useragent = "<invalid>"
                     , platform  = "<invalid>"
                     , ipaddr    = "127.0.0.1"
                     , resolut   = "<invalid>"
                     , depth     = 0
                     , langs     = "" }
        ,
        Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    (model, Cmd.none)

view : Model -> Html Msg
view model =
    Html.div [] [ Html.div
                    [ Attr.class "form-group row" ]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label" ]
                        [ Html.text "User Agent"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value model.useragent ] [] ]]

                , Html.div
                    [ Attr.class "form-group row" ]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label" ]
                        [ Html.text "Platform"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value model.platform ] [] ]]     
                
                , Html.div
                    [ Attr.class "form-group row" ]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label" ]
                        [ Html.text "IP/Host"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value model.ipaddr ] [] ]]

                , Html.div
                    [ Attr.class "form-group row"]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label"]
                        [ Html.text "Resolution"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value model.resolut ] [] ] ]

                , Html.div
                    [ Attr.class "form-group row" ]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label" ]
                        [ Html.text "Pixel depth"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value (String.fromInt model.depth) ] [] ] ]

                , Html.div
                    [ Attr.class "form-group row" ]
                    [ Html.label
                        [ Attr.class "col-sm-2 col-form-label" ]
                        [ Html.text "Langs"]
                    , Html.div
                        [ Attr.class "col-sm-10" ]
                        [ Html.input [ Attr.type_ "text"
                                     , Attr.class "form-control-plaintext"
                                     , Attr.readonly True
                                     , Attr.value model.langs ] [] ] ]                                                                                                                                                                         

                ]

main =
    Browser.element
        { init          = init
        , view          = view
        , update        = update
        , subscriptions = \_ -> Sub.none
        }