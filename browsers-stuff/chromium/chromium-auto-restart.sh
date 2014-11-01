#!/usr/bin/env bash

while true
do
    CHROMIUM_PROCS=`ps -eo pid,args | grep chromium-browser | grep -v grep | head -1`

    if [ -z "$CHROMIUM_PROCS" ]
    then
        rm -rf "$HOME/.config/chromium"
        rm -rf "$HOME/.cache/chromium"

        CHROMIUM_PREFS_FILE="$HOME/.config/chromium/Default/Preferences"

        mkdir -p "$HOME/.config/chromium/Default"
        touch "$CHROMIUM_PREFS_FILE"
        chmod 600 "$CHROMIUM_PREFS_FILE"

        # pre-whitelisting Java plugin to suppress user dialog showing
        echo '{
   "profile": {
      "content_settings": {
         "clear_on_exit_migrated": true,
         "pattern_pairs": {
            "*,*": {
               "per_plugin": {
                  "java-runtime-environment": 1
               }
            },
            "file:///home/localuser/file.html,*": {
               "plugins": 1
            }
         },
         "plugin_whitelist": {
            "java-runtime-environment": true
         },
         "pref_version": 1
      }
   }
}' > "$CHROMIUM_PREFS_FILE"

        chromium-browser \
            --process-per-tab \
            --no-pings \
            --disable-sync \
            --disable-geolocation \
            --disable-desktop-notifications \
            --kiosk \
            --disable-web-security \
            --allow-file-access \
            --allow-file-access-from-files \
            --disable-local-storage \
            --no-first-run \
            --no-default-browser-check \
            --disable-dev-tools \
            --disable-extensions \
            --disable-data-transfer-items \
            --disable-history-quick-provider \
            --disable-history-url-provider \
            --disable-translate \
            --homepage 'about:blank' > /dev/null &

# hack to open content in the second tab, not in first

        CHROMIUM_PROCS_COUNT=-1

        until [ "$CHROMIUM_PROCS_COUNT" -gt "5" ]
        do
            CHROMIUM_PROCS_COUNT=`ps -eo pid,args | grep chromium-browser | grep -v grep | wc -l`

            sleep 0.25s
        done

        sleep 1s && chromium-browser \
            --process-per-tab \
            --new-tab-page-4 file:///home/localuser/file.html > /dev/null
    fi

    sleep 3s
done
