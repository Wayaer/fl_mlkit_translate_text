import Flutter
import UIKit

public class FlMlKitTranslateTextPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fl_mlkit_translate_text", binaryMessenger: registrar.messenger())
    let instance = FlMlKitTranslateTextPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
