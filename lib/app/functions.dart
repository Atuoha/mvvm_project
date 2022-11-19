import 'dart:io';
import 'package:flutter/services.dart';
import '../domain/models/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<DeviceInfo> getDeviceInfo() async {
  String name = "Unknown";
  String version = "Unknown";
  String identifier = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      version = build.version.toString();
      identifier = build.androidId!;
    } else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      version = build.systemVersion!;
      identifier = build.identifierForVendor!;
    }
  } on PlatformException {
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}
