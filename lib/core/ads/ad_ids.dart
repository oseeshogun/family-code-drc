import 'dart:io';

import 'package:flutter/foundation.dart';

/// AdMob ad unit IDs (Android), injected with `--dart-define-from-file env/<mode>.json`.
class AdIds {
  AdIds._();

  static bool get supported => !kIsWeb && Platform.isAndroid && banner.isNotEmpty;

  static const banner = String.fromEnvironment('ADMOB_BANNER_ID');

  static const appOpen = String.fromEnvironment('ADMOB_APP_OPEN_ID');
}
