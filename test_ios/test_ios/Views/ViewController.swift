//
//  ViewController.swift
//  test_ios
//
//  Created by Daniel Kin Ivatiuk on 30/01/23.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

   
  }

  @IBAction func showFlutter() {
    let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
      
    
//      let navigationController = UINavigationController(rootViewController: self)
    let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
      flutterViewController.modalPresentationStyle = .fullScreen
      flutterViewController.title = "Olá"
      
      let cookieChannel = FlutterMethodChannel(name: "samples.flutter.dev/cookies",
                                               binaryMessenger: flutterViewController.binaryMessenger)
      cookieChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          self.receiveCookie(result: result)
      })
      
      let channel = FlutterMethodChannel(name: "flutter_to_native", binaryMessenger: flutterViewController.binaryMessenger)

      channel.invokeMethod("someMethod", arguments: nil) { result in
        if let someResult = result as? String {
            print(someResult)
        }
      }

//    self.show(flutterViewController, sender: nil)
      self.show(flutterViewController, sender: nil)
  }
    
    private func receiveCookie(result: FlutterResult) {
        var headerDic: [String: String] = ["name":"CookieName", "value":"CookieValue", "deviceId":"12345"]
        result(headerDic)
    }
}
