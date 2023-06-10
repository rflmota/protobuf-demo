#!/bin/zsh -li

DISPLAY_PB_DEF="cat greeting_cli.proto"
echo -n "> "
echo $DISPLAY_PB_DEF | pv -qL $[10+(-2 + RANDOM%5)]
eval $DISPLAY_PB_DEF

DISPLAY_PB_CMD="cat cli_greeting_message"
echo -n "> "
echo $DISPLAY_PB_CMD | pv -qL $[10+(-2 + RANDOM%5)]
eval $DISPLAY_PB_CMD

ENC_CMD="cat cli_greeting_message | protoc --encode=tutorial.Greet greeting_cli.proto | tee enc"
echo ""; echo -n "> "
echo $ENC_CMD | pv -qL $[10+(-2 + RANDOM%5)]
eval $ENC_CMD

XXD_CMD="xxd enc"
echo ""; echo -n "> "
echo $XXD_CMD | pv -qL $[10+(-2 + RANDOM%5)]
eval $XXD_CMD

DEC_CMD="cat enc | protoc --decode=tutorial.Greet greeting_cli.proto | tee dec"
echo -n "> "
echo $DEC_CMD | pv -qL $[10+(-2 + RANDOM%5)]
eval $DEC_CMD

CAT_DEC="cat dec"
echo -n "> "
echo $CAT_DEC | pv -qL $[10+(-2 + RANDOM%5)]
eval $CAT_DEC
