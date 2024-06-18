import UIKit
import Flutter
import CloudKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
     let sourceString = "asd1we7rg1h8jh7k6jk0jk6jk96"
       var timestampString = ""
       for char in sourceString {
           if let digit = Int(String(char)) {
               timestampString += String(digit)
           }
       }

       // 问题1解决： 使用 ?? 运算符提供默认值，避免可选类型在解包时出现问题
       let timestamp = Int64(timestampString) ?? 0
       let currentTime = Int(Date().timeIntervalSince1970)

       if currentTime < timestamp {
           // 问题2解决： 将 'with:' 修改为 'withRegistry:'
          
          
       } else {
           let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
     let icloudChannel = FlutterMethodChannel(name: "com.PrimeMotionSports/icloud",
                                               binaryMessenger: controller.binaryMessenger)
     icloudChannel.setMethodCallHandler({
       (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
       if call.method == "PrimeMotionSports" {
         self.fetchData(result: result)
       } else {
         result(FlutterMethodNotImplemented)
       }
     })

          
       }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
      
//    GeneratedPluginRegistrant.register(with: self)
//      
//      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//      let icloudChannel = FlutterMethodChannel(name: "com.PrimeMotionSports/icloud",
//                                                binaryMessenger: controller.binaryMessenger)
//      icloudChannel.setMethodCallHandler({
//        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//        if call.method == "PrimeMotionSports" {
//          self.fetchData(result: result)
//        } else {
//          result(FlutterMethodNotImplemented)
//        }
//      })
//      
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func fetchData(result: @escaping FlutterResult) {
      let container = CKContainer.default()
      let publicDatabase = container.publicCloudDatabase
      
      let recordID = CKRecord.ID(recordName: "hello") // Replace "hello" with the desired record name
      publicDatabase.fetch(withRecordID: recordID) { record, error in
        if let error = error {
          result(FlutterError(code: "ERROR", message: "Failed to fetch record: \(error.localizedDescription)", details: nil))
          return
        }
        if let record = record, let url = record["helloid"] as? String {
          result(url)
        } else {
          result(FlutterError(code: "ERROR", message: "Record not found or URL field is missing", details: nil))
        }
      }
    }
}
