import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKEY("AIzaSyBaWomarEwcdwA8eB1XbpXKG-QpAQjYHQM")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
