PROJECT = Sweet/Sweet.xcodeproj
SCHEME = SweetTests
DEVICE_HOST = platform='iOS Simulator',OS='8.3',name='iPhone 6'

ci:
	xcodebuild -project $(PROJECT) -scheme $(SCHEME) -sdk iphonesimulator -destination $(DEVICE_HOST) build test | xcpretty -c; exit ${PIPESTATUS[0]}
