#!/usr/bin/env bash
set -euo pipefail

# Keyboard and typing
# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
# Short delay before repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 25
# Hold repeats keys, no accent menu
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Tab moves between all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
# No autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# No smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# No smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Double space doesn't add full stop
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Appearance
# Light/dark follows time of day
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Dialogs and apps
# Save dialogs open expanded
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Print dialogs open expanded
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Apps don't reopen windows on relaunch
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
# New documents save to disk, not iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Quit printer app when jobs finish
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# No in-app rating prompts
defaults write com.apple.appstore InAppReviewEnabled -int 0

# Trackpad
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Drag with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# Light click pressure
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
# Silent click
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0
# Same for external Magic Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Dock
# Hide Dock until hovered
defaults write com.apple.dock autohide -bool true
# Show Dock instantly on hover
defaults write com.apple.dock autohide-delay -float 0
# Faster Dock hide/show animation
defaults write com.apple.dock autohide-time-modifier -float 0.5
# Dock on left edge
defaults write com.apple.dock orientation -string left
# Icon size
defaults write com.apple.dock tilesize -int 44
# No recent apps section
defaults write com.apple.dock show-recents -bool false
# Keep Spaces in fixed order
defaults write com.apple.dock mru-spaces -bool false
# Hidden apps look translucent
defaults write com.apple.dock showhidden -bool true
# Bottom-right hot corner starts screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Finder
# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Full path in window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Add Quit to Finder menu
defaults write com.apple.finder QuitMenuItem -bool true
# List view
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
# Folders before files
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Search current folder
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# New windows open Recents
defaults write com.apple.finder NewWindowTarget -string PfAF
# No warning on extension change
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Drag-hover opens folders faster
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1
# No .DS_Store on network shares
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# No .DS_Store on USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Show ~/Library in Finder
chflags nohidden ~/Library

# Window tiling
# No gaps between tiled windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

nvram_set() {
  [[ "$(nvram "$1" 2>/dev/null | cut -f2)" == "$2" ]] || sudo nvram "$1=$2"
}
# Mute startup chime
nvram_set StartupMute %01
# Verbose boot
nvram_set boot-args -v

killall Dock Finder SystemUIServer 2>/dev/null || true

# vim: set ft=sh
