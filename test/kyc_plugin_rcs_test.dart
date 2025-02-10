import 'package:flutter_test/flutter_test.dart';
import 'package:kyc_plugin_rcs/kyc_plugin_rcs.dart';
import 'package:kyc_plugin_rcs/kyc_plugin_rcs_platform_interface.dart';
import 'package:kyc_plugin_rcs/kyc_plugin_rcs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKycPluginRcsPlatform
    with MockPlatformInterfaceMixin
    implements KycPluginRcsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KycPluginRcsPlatform initialPlatform = KycPluginRcsPlatform.instance;

  test('$MethodChannelKycPluginRcs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKycPluginRcs>());
  });

  test('getPlatformVersion', () async {
    KycPluginRcs kycPluginRcsPlugin = KycPluginRcs();
    MockKycPluginRcsPlatform fakePlatform = MockKycPluginRcsPlatform();
    KycPluginRcsPlatform.instance = fakePlatform;

    expect(await kycPluginRcsPlugin.getPlatformVersion(), '42');
  });
}
