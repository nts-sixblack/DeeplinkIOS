//
//  BlogsDeeplinkHandler.swift
//  TestDeepLinkUiKit
//
//  Created by Thanh Sau on 13/09/2023.
//

import Foundation
import UIKit

final class BlogsDeeplinkHandler: DeeplinkHandlerProtocol {
    
    private weak var rootViewController: UIViewController?
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    // MARK: - DeeplinkHandlerProtocol
    
    func canOpenURL(_ url: URL) -> Bool {
        return url.absoluteString.hasPrefix("deeplink://blogs")
    }
    
    func openURL(_ url: URL) {
        guard canOpenURL(url) else {
            return
        }
        
        // mock the navigation
        let viewController = UIViewController()
        switch url.path {
        case "/new":
            viewController.title = "Blog Editing"
            viewController.view.backgroundColor = .orange
        case "/edit":
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                   // Kiểm tra queryItems có tồn tại
                   if let queryItems = components.queryItems {
                       // Duyệt qua từng tham số và giá trị tương ứng
                       for queryItem in queryItems {
                           if let value = queryItem.value {
                               print("Tham số: \(queryItem.name), Giá trị: \(value)")
                           }
                       }
                   }
               }
            
            viewController.title = "checkkk"
            viewController.view.backgroundColor = .gray
        default:
            viewController.title = "Blog Listing"
            viewController.view.backgroundColor = .cyan
        }
        
        rootViewController?.present(viewController, animated: true)
    }
}
