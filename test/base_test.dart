import 'package:flutter_test/flutter_test.dart';
import 'package:base/base.dart';
import 'package:base/base_platform_interface.dart';
import 'package:base/base_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBasePlatform
    with MockPlatformInterfaceMixin
    implements BasePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BasePlatform initialPlatform = BasePlatform.instance;

  test('$MethodChannelBase is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBase>());
  });

  test('getPlatformVersion', () async {
    Base basePlugin = Base();
    MockBasePlatform fakePlatform = MockBasePlatform();
    BasePlatform.instance = fakePlatform;

    expect(await basePlugin.getPlatformVersion(), '42');
  });
}
