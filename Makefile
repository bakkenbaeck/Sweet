WORKSPACE = Example/Sweet.xcworkspace
SCHEME = Sweet_Tests
DEVICE_HOST = platform='iOS Simulator',OS='8.3',name='iPhone 6'

ci:
	xcodebuild -workspace $(WORKSPACE) -scheme $(SCHEME) -sdk iphonesimulator -destination $(DEVICE_HOST) build test | xcpretty -c; exit ${PIPESTATUS[0]}
