#!/usr/bin/env bash

function main() {
    /Users/mikyou/Env/flutter_pre/flutter/bin/flutter packages pub run build_runner clean
    /Users/mikyou/Env/flutter_pre/flutter/bin/flutter packages pub run build_runner build --delete-conflicting-outputs
}

main