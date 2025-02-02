FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter
DART := $(FVM) dart

.PHONY: pub-get
pub-get:
	$(FLUTTER) pub get

.PHONY: pub-upgrade
pub-upgrade:
	$(FLUTTER) pub upgrade

.PHONY: clean
clean:
	$(FLUTTER) clean
	rm -rf ios/Pods ios/Podfile.lock

.PHONY: pod-install
pod-install:
	cd ios && pod install && cd ..

.PHONY: clean-build
clean-build:
	make clean
	make pub-get
	make pod-install
	make build-slang

.PHONY: build-runner-build
build-runner-build:
	$(DART) run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	$(DART) run build_runner clean
	$(DART) run build_runner watch --delete-conflicting-outputs
