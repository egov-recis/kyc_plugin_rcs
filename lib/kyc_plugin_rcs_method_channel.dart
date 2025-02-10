import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kyc_plugin_rcs_platform_interface.dart';

/// An implementation of [KycPluginRcsPlatform] that uses method channels.
class MethodChannelKycPluginRcs extends KycPluginRcsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kyc_plugin_rcs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
