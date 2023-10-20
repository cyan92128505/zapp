.PHONY: run run-dev run-web-dev run-web build build-apk build-model test watch help

help:
	@echo "make run 執行default app"
	@echo "make run-web 執行web app"
	@echo "make build 建置"
	@echo "make build-apk 建置APK"
	@echo "make build-model 編譯元件"
	@echo "make test 編譯元件"
	@echo "make watch 即時編譯"	
	@echo "make update-build-number 上升一個版本號"	

run:
	@fvm flutter run

run-web:
	@fvm flutter run -d web-server --web-port=3000

build:
	@fvm flutter build ios --release

build-apk:
	@fvm flutter build apk

build-model:
	@fvm dart run build_runner build --delete-conflicting-outputs

test:
	@fvm flutter test

watch:
	@dart pub run build_runner watch
