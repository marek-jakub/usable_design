# Usable Design

This project is a study of usablity questions posed by Mugisha et al. (2019) [[1]](#1), with the main goal of researching usability design practices as seen by professional developers.

## Table of Contents

- [Usable Design description](#usable-design-description)
- [Install and run](#install-and-run)
- [Testing](#testing)
- [Licence](#licence)
- [References](#references)

## Usable Design description

The application lists usability questions posed by Mugisha et al. (2019) [[1]](#1), which are ordered according to the importance weight. These questions pertain to the mobile form usage, but have a wider application in usable design of forms.

Each question leads to an interactive sample, with the main goal to show how the usable design works, but which also explains why such feature could be used. There are many ways in how these features could be implemented, and this study's aim is not to explore all of them.

## Install and run

The latest version of Flutter used to run and test the application is version 3.16.8, with Dart SDK version: 3.2.4.

After downloading the codebase and placing it at a chosen directory, navigate the CLI to the project directory, the application can be run:

Add and enable a device the application to be run on, e.g.:

```bash
flutter create --platform=<platform> .
flutter config --enable-<platform>-desktop
```

For example, using linux as a platform:

```bash
flutter create --platform=linux .
flutter config --enable-linux-desktop
```

Run the application:

```bash
flutter run -d linux
```

To choose from available devices, run:

```bash
flutter run lib/main.dart
```

The available and connected devices will be shown, with the ability to choose the appropriate one.

## Testing

Unit tests can be run by applying following commands in the project directory:

```bash
flutter test
```

or

```bash
flutter test test/widget_test.dart
```

Choose from available devices.

## Licence

[MIT](https://choosealicense.com/licenses/mit/)

## References

<a id="1">[1]</a> Mugisha, A. et al. (2019) ‘A usability design checklist for Mobile electronic data capturing forms: the validation process’, BMC medical informatics and decision making, 19(1), pp. 4–4. Available at: https://doi.org/10.1186/s12911-018-0718-3.
