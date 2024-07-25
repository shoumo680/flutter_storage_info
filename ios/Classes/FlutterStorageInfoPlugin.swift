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
           if let homeDirectoryURL = URL(string: NSHomeDirectory()) {
               do {
                   let values = try homeDirectoryURL.resourceValues(forKeys: [.volumeTotalCapacityKey, .volumeAvailableCapacityForImportantUsageKey])
                   if let totalSpace = values.volumeTotalCapacity, let freeSpace = values.volumeAvailableCapacityForImportantUsage {
                       result(freeSpace)
                       break
                   }
               } catch {
                   result(1)
                    break
               }
           }
           result(2)
           break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
