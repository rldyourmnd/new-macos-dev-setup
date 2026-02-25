#!/usr/bin/env bash
set -euo pipefail

install_stats_optional() {
  if [[ "${INSTALL_STATS:-0}" != "1" ]]; then
    return
  fi

  if ! brew_cask_exists stats; then
    log "stats cask is unavailable in Homebrew; skipping"
    return
  fi

  brew_install_casks stats

  if [[ "${CONFIGURE_STATS:-0}" == "1" ]]; then
    configure_stats_profile
  fi
}

configure_stats_profile() {
  local app_path="/Applications/Stats.app"
  local prefs_domain="eu.exelban.Stats"
  local team_id=""
  local widget_suite=""

  if [[ ! -d "$app_path" ]]; then
    log "Stats app not found at $app_path; skipping profile"
    return
  fi

  team_id="$(/usr/libexec/PlistBuddy -c "Print :TeamId" "$app_path/Contents/Info.plist" 2>/dev/null || true)"
  if [[ -n "$team_id" ]]; then
    widget_suite="${team_id}.eu.exelban.Stats.widgets"
  fi

  run osascript -e 'tell application "Stats" to quit' || true
  run defaults write "$prefs_domain" setupProcess -bool true
  run defaults write "$prefs_domain" runAtLoginInitialized -bool true
  run defaults write "$prefs_domain" update-interval -string "Silent"
  run defaults write "$prefs_domain" temperature_units -string "system"
  run defaults write "$prefs_domain" dockIcon -bool false
  run defaults write "$prefs_domain" pause -bool false

  run defaults write "$prefs_domain" CPU_state -bool true
  run defaults write "$prefs_domain" GPU_state -bool true
  run defaults write "$prefs_domain" RAM_state -bool true
  run defaults write "$prefs_domain" Disk_state -bool true
  run defaults write "$prefs_domain" Network_state -bool true
  run defaults write "$prefs_domain" Sensors_state -bool true
  run defaults write "$prefs_domain" Battery_state -bool true
  run defaults write "$prefs_domain" Bluetooth_state -bool false
  run defaults write "$prefs_domain" Clock_state -bool false

  run defaults write "$prefs_domain" CPU_position -int 1
  run defaults write "$prefs_domain" GPU_position -int 2
  run defaults write "$prefs_domain" RAM_position -int 3
  run defaults write "$prefs_domain" Disk_position -int 4
  run defaults write "$prefs_domain" Network_position -int 5
  run defaults write "$prefs_domain" Sensors_position -int 6
  run defaults write "$prefs_domain" Battery_position -int 7
  run defaults write "$prefs_domain" Bluetooth_position -int 8
  run defaults write "$prefs_domain" Clock_position -int 9

  if [[ -n "$widget_suite" ]]; then
    run defaults write "$widget_suite" CPU_state -bool true
    run defaults write "$widget_suite" GPU_state -bool true
    run defaults write "$widget_suite" RAM_state -bool true
    run defaults write "$widget_suite" Disk_state -bool true
    run defaults write "$widget_suite" Network_state -bool true
    run defaults write "$widget_suite" Sensors_state -bool true
    run defaults write "$widget_suite" Battery_state -bool true
    run defaults write "$widget_suite" Bluetooth_state -bool false
    run defaults write "$widget_suite" Clock_state -bool false
    run defaults write "$widget_suite" systemWidgetsUpdates_state -bool false
  fi

  run osascript -e 'tell application "System Events" to if not (exists login item "Stats") then make login item at end with properties {name:"Stats", path:"/Applications/Stats.app", hidden:false}' || true
  run open "$app_path"
}
