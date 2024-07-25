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
              if let homeDirectoryURL = URL(string: NSHomeDirectory()) {
                  do {
                      let values = try homeDirectoryURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
                      if let freeSpace = values.volumeAvailableCapacityForImportantUsage {
                          result(freeSpace)
                          break
                      }else{
                          result(1)
                          break
                      }
                  } catch {
                      result(2)
                      break
                  }
              }
              result(3)
              break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
