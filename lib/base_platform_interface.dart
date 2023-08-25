import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_method_channel.dart';

abstract class BasePlatform extends PlatformInterface {
  /// Constructs a BasePlatform.
  BasePlatform() : super(token: _token);

  static final Object _token = Object();

  static BasePlatform _instance = MethodChannelBase();

  /// The default instance of [BasePlatform] to use.
  ///
  /// Defaults to [MethodChannelBase].
  static BasePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BasePlatform] when
  /// they register themselves.
  static set instance(BasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
