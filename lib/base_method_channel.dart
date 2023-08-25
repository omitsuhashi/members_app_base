import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_platform_interface.dart';

/// An implementation of [BasePlatform] that uses method channels.
class MethodChannelBase extends BasePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
