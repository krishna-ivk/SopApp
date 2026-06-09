#!/bin/bash
# Skola CBSE SOP Stakeholder App - Start Script
# This is a Flutter project. To run:
# 1. Install Flutter SDK from https://flutter.dev
# 2. Run: flutter pub get
# 3. Run: flutter run

echo "Skola CBSE SOP Stakeholder App"
echo "==============================="
echo ""
echo "This is a Flutter mobile app project."
echo "To build and run:"
echo "  1. Install Flutter SDK: https://flutter.dev/docs/get-started/install"
echo "  2. flutter pub get"
echo "  3. flutter run"
echo ""

# If Flutter is available, try to run
if command -v flutter &> /dev/null; then
    flutter pub get
    flutter run
else
    echo "Flutter SDK not found. Please install it first."
fi
