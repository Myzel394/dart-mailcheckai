<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# API Wrapper for [mailcheck.ai](https://mailcheck.ai)

## Getting started

Install the package from pub.dev

```bash
dart pub add mailcheckai
```

## Usage

Import the package

```dart
import 'package:mailcheckai/mailcheckai.dart';
```

`MailCheckManager` exposes all the methods to interact with the API

```dart
final domainResult = await MailCheckManager.validateDomain('protonmail.com');
```

# Sponsoring

Creating Open Source Software is hard work.
I use my free time to create and maintain this and other packages.

If everyone who uses this package donates just $1, I could use my time to completely
focus on creating and maintaining open source software.

If you want to support me, please consider donating via [GitHub Sponsors](https://github.com/Myzel394).
I also accept [Monero (XMR)](https://github.com/Myzel394).
