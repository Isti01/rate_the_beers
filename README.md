# rate_the_beers

An application for rating beers

## How to set up the development environment locally

You need to have a few tools set up before running the project (this is the hard part):

- [Flutter](https://docs.flutter.dev/get-started/install)
- Set up Platform SDKs (https://docs.flutter.dev/get-started/install/windows)

Then open a terminal in the folder of the repository and run the following commands:

```shell
flutter create . --platforms android,windows # for regenerating missing project files
dart run build_runner build --delete-conflicting-outputs # for generating missing .dart source files
```

## How to run

It is strongly recommended to download [Android Studio](https://developer.android.com/studio) (preferably) or [VSCode](https://code.visualstudio.com/) and press the green magic button to run the application.

Running the app from the terminal:
```shell
flutter run [-d <device_id>]
```

Flutter is not generating code automatically, so it's recommended to run build_runner in watch mode in development
```shell
flutter packages pub run build_runner watch --delete-conflicting-outputs
```