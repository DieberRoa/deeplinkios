//
//  ProductDeepLinkParser.swift
//  deeplink
//
//  Created by Dieber Roa M on 27/02/23.
//

import Foundation

class MessageDeepLinkParser : DeepLinkParser {
    
    var action: (Int) -> ()
    
    init(action: @escaping (Int) -> ()) {
        self.action = action
    }
    
    func canHandleDeepLink(_ urlComponents: URLComponents) -> Bool {
        return urlComponents.queryItems?.contains {
            $0.name == "id"
        } ?? false
    }
    
    func handleDeepLink(_ urlComponents: URLComponents) {
        let idQueryItem = urlComponents.queryItems?.first {
            $0.name == "id"
        }
        guard
            let value = idQueryItem?.value,
            let id = Int(value)
        else {
            return
        }
        action(id)
    }
}
