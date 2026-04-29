#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-1.0.0}"
APP="build/macos/Build/Products/Release/BijecBet.app"
DMG="BijecBet-${VERSION}.dmg"

flutter clean
flutter build macos --release

# No codesign step. Flutter's build output is signed enough to launch.

rm -f "$DMG"
create-dmg \
  --volname "BijecBet" \
  --window-size 600 400 \
  --icon "BijecBet.app" 175 190 \
  --app-drop-link 425 190 \
  --no-internet-enable \
  "$DMG" "$APP"

echo "✓ $DMG ready"