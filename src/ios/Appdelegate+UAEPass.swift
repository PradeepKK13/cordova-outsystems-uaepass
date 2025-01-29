
import Foundation
import UAEPassClient

extension AppDelegate{
    
    open override func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        if #available(iOS 13.0, *) {
            print("<><><><> appDelegate URL : \(url.absoluteString)")
            NSLog("appDelegate URL %d: %@", url, "absoluteString")
            if url.absoluteString.contains(HandleURLScheme.externalURLSchemeSuccess()) {
                if let topViewController = UserInterfaceInfo.topViewController() {
                    if let webViewController = topViewController as? UAEPassWebViewController {
                        webViewController.forceReload()
                    }
                }
                return true
            } else if url.absoluteString.contains(HandleURLScheme.externalURLSchemeFail()) {
                guard let webViewController = UserInterfaceInfo.topViewController() as? UAEPassWebViewController  else { return false}
                webViewController.foreceStop()
                webViewController.dismiss(animated: true)
                return false
            }
            NSLog("appDelegate URL returning false")
            return false
        } else {
            NSLog("appDelegate URL returning false")
            return false;
        }
    }
    
//     open override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//         if #available(iOS 13.0, *) {
//             print("<><><><> appDelegate URL : \(url.absoluteString)")
//             NSLog("appDelegate URL %d: %@", url, "absoluteString")
//             if url.absoluteString.contains(HandleURLScheme.externalURLSchemeSuccess()) {
//                 if let topViewController = UserInterfaceInfo.topViewController() {
//                     if let webViewController = topViewController as? UAEPassWebViewController {
//                         webViewController.forceReload()
//                     }
//                 }
//                 return true
//             } else if url.absoluteString.contains(HandleURLScheme.externalURLSchemeFail()) {
//                 guard let webViewController = UserInterfaceInfo.topViewController() as? UAEPassWebViewController  else { return false}
//                 webViewController.foreceStop()
//                 webViewController.dismiss(animated: true)
//                 return false
//             }
//             NSLog("appDelegate URL returning false")
//             return false
//         } else {
//             NSLog("appDelegate URL returning false")
//             return false;
//         }
//     }
    
}
