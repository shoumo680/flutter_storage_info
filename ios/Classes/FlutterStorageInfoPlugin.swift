import Flutter
import UIKit
import Foundation

public class FlutterStorageInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_storage_info", binaryMessenger: registrar.messenger())
    let instance = FlutterStorageInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
       case "getStorageFreeSpace":
             if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                 return result(space ?? 0)
             } else {
                  result(1)
             }
              break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
