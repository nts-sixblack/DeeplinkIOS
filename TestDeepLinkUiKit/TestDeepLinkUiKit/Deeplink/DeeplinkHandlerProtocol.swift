//
//  DeeplinkHandlerProtocol.swift
//  TestDeepLinkUiKit
//
//  Created by Thanh Sau on 13/09/2023.
//

import Foundation

protocol DeeplinkHandlerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func openURL(_ url: URL)
}
