#!/bin/bash
set -euo pipefail

# --- Paths ---
SRC_XCFRAMEWORK="Sources/LDIDBinary/LDID.xcframework"
OUT_DIR="./XCBuild"
mkdir -p "$OUT_DIR"

# --- Build arm64 & arm64_x86_64-simulator libraries ---
cp -R "$SRC_XCFRAMEWORK/ios-arm64" "$OUT_DIR/ios-arm64"
cp -R "$SRC_XCFRAMEWORK/ios-arm64_x86_64-simulator" "$OUT_DIR/ios-arm64_x86_64-simulator"

# --- Generate new XCFramework ---
rm -rf "$OUT_DIR/LDID.xcframework"
xcodebuild -create-xcframework \
  -library "$OUT_DIR/ios-arm64/libLDID_ios.a" -headers "$OUT_DIR/ios-arm64/Headers" \
  -library "$OUT_DIR/ios-arm64_x86_64-simulator/libLDID_sim.a" -headers "$OUT_DIR/ios-arm64_x86_64-simulator/Headers" \
  -output "$OUT_DIR/LDID.xcframework"

# --- Compute SHA256 checksum ---
shasum -a 256 "$OUT_DIR/LDID.xcframework/Info.plist" > "$OUT_DIR/LDID.xcframework.sha256"

echo "✅ XCFramework built and checksum generated at $OUT_DIR"
