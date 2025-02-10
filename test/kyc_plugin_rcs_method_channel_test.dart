import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kyc_plugin_rcs/kyc_plugin_rcs_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelKycPluginRcs platform = MethodChannelKycPluginRcs();
  const MethodChannel channel = MethodChannel('kyc_plugin_rcs');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
