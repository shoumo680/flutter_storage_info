import Flutter
import UIKit

public class FlutterStorageInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_storage_info", binaryMessenger: registrar.messenger())
    let instance = FlutterStorageInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getStorageFreeSpace":
        if let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
               let freeSpace = attributes[FileAttributeKey.systemFreeSize] as? NSNumber {
                result(freeSpace.int64Value)
            }
            result(0)
            break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
