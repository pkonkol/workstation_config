#!/usr/bin/bash

# ﯈     﫤     ﮤ    ﮣ     零
# ﮤ

set -e

export S="$HOME/.xidlehook.sock"
export HIB="4"
export SUS="3"
export LOCK="2"

if [[ ! -S "$S" ]]; then
    echo "ﯡ"
    exit 0
fi

get_mode() {
    # xidlehook-client --socket "$S" query
    # notify-send testqyery "$HOME $(pwd) $(xidlehook-client --socket "$S" query)"
    suspend=$(xidlehook-client --socket "$S" query --timer $SUS | grep disabled | awk '{print $2}' | tr -d ',')
    hibernate=$(xidlehook-client --socket "$S" query --timer $HIB | grep disabled | awk '{print $2}' | tr -d ',')
    lock=$(xidlehook-client --socket "$S" query --timer $LOCK | grep disabled | awk '{print $2}' | tr -d ',')
    # notify-send testqu "$suspend\n$hibernate\n$lock"

    # false is means disabled
    if [[ "$suspend" == "false" && "$hibernate" == "true" && "$lock" == "false" ]]; then
        # notify-send get "exporting normal for `echo "$suspend"="false" "$hibernate"="true"  "$lock"="false"`"
        export MODE="normal"
    elif [[ "$suspend" == "true" && "$hibernate" == "false" && "$lock" == "false" ]]; then 
        # notify-send get "exporting powersabe"
        export MODE="powersave"
    elif [[ "$suspend" == "true" && "$hibernate" == "true" && "$lock" == "false" ]]; then 
        # notify-send get "exporting noleep"
        export MODE="nosleep"
    elif [[ "$suspend" == "true" && "$hibernate" == "true" && "$lock" == "true" ]]; then 
        # notify-send get "exporting nolock"
        export MODE="nolock"
    fi
}

toggle_mode() {
    # Checked in the direction of toggle, switch moves to the next one
    case $MODE in 
        "powersave")
            # switch to normal
            xidlehook-client --socket $S control --timer $HIB --action Disable
            xidlehook-client --socket $S control --timer $SUS --action Enable
            xidlehook-client --socket $S control --timer $LOCK --action Enable
        ;;
        "normal")
            # switch to nosleep
            xidlehook-client --socket $S control --timer $HIB --action Disable
            xidlehook-client --socket $S control --timer $SUS --action Disable
            xidlehook-client --socket $S control --timer $LOCK --action Enable
        ;;
        "nosleep")
            # switch to nolock
            xidlehook-client --socket $S control --timer $HIB --action Disable
            xidlehook-client --socket $S control --timer $SUS --action Disable
            xidlehook-client --socket $S control --timer $LOCK --action Disable
        ;;
        "nolock")
            # switch to powersave
            xidlehook-client --socket $S control --timer $HIB --action Enable
            xidlehook-client --socket $S control --timer $SUS --action Disable
            xidlehook-client --socket $S control --timer $LOCK --action Enable
        ;;
        *)
            notify-send casemode "didnt match any mode, going back to default"
            # switch to normal
            xidlehook-client --socket $S control --timer $HIB --action Disable
            xidlehook-client --socket $S control --timer $SUS --action Enable
            xidlehook-client --socket $S control --timer $LOCK --action Enable
        ;;
    esac
}

print_mode() {
    if [ "$MODE" = "normal" ]; then
        echo "﯈"
    elif [ "$MODE" = "powersave" ]; then
        echo "ﮤ"
    elif [ "$MODE" = "nosleep" ]; then
        echo "零"
    elif [ "$MODE" = "nolock" ]; then
        echo "零"
    fi
}

case $1 in
    --next)
        get_mode
        toggle_mode
        get_mode
        print_mode
    ;;
    *)
        get_mode
        print_mode
    ;;
esac