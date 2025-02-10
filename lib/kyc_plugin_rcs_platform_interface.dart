import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kyc_plugin_rcs_method_channel.dart';

abstract class KycPluginRcsPlatform extends PlatformInterface {
  /// Constructs a KycPluginRcsPlatform.
  KycPluginRcsPlatform() : super(token: _token);

  static final Object _token = Object();

  static KycPluginRcsPlatform _instance = MethodChannelKycPluginRcs();

  /// The default instance of [KycPluginRcsPlatform] to use.
  ///
  /// Defaults to [MethodChannelKycPluginRcs].
  static KycPluginRcsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KycPluginRcsPlatform] when
  /// they register themselves.
  static set instance(KycPluginRcsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
