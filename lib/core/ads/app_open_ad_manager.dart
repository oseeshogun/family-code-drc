import 'package:family_code/core/ads/ad_ids.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Loads and shows an app open ad on cold start and when the app returns to the foreground.
class AppOpenAdManager with WidgetsBindingObserver {
  AppOpenAd? _ad;
  DateTime? _loadedAt;
  bool _showing = false;

  static const _maxAge = Duration(hours: 4);

  void start() {
    WidgetsBinding.instance.addObserver(this);
    _load();
  }

  bool get _isValid => _ad != null && _loadedAt != null && DateTime.now().difference(_loadedAt!) < _maxAge;

  void _load() {
    AppOpenAd.load(
      adUnitId: AdIds.appOpen,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _ad = ad;
          _loadedAt = DateTime.now();
        },
        onAdFailedToLoad: (_) {},
      ),
    );
  }

  void _show() {
    if (_showing) return;
    if (!_isValid) {
      _ad?.dispose();
      _ad = null;
      _load();
      return;
    }
    _ad!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (_) => _showing = true,
      onAdDismissedFullScreenContent: (ad) {
        _showing = false;
        ad.dispose();
        _ad = null;
        _load();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        _showing = false;
        ad.dispose();
        _ad = null;
        _load();
      },
    );
    _ad!.show();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _show();
  }
}
