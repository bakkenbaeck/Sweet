ci:
	xcodebuild -project Sweet/Sweet.xcodeproj -scheme SweetTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.3' build test | xcpretty -c; exit ${PIPESTATUS[0]}
