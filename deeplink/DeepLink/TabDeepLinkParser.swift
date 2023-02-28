//
//  DeeplinkParser.swift
//  deeplink
//
//  Created by Dieber Roa M on 27/02/23.
//

import Foundation
import SwiftUI


protocol DeepLinkParser {
    func canHandleDeepLink(_ urlComponents : URLComponents) -> Bool
    func handleDeepLink(_ urlComponents : URLComponents)
}

class TabDeepLinkParser : DeepLinkParser {
    
    let tabs: [TabRepresentation]
    let childrens: [DeepLinkParser]
    let action: (String) -> ()
    
    init(tabs: [TabRepresentation], childrens: [DeepLinkParser], action: @escaping (String) -> ()) {
        self.tabs = tabs
        self.childrens = childrens
        self.action = action
    }
    
    func canHandleDeepLink(_  urlComponents: URLComponents) -> Bool {
        guard let host = urlComponents.host else {
            return false
        }
        return tabs.map(\.title).contains(host) &&
        childrens.first { $0.canHandleDeepLink(urlComponents) } != nil
    }
    
    func handleDeepLink(_ urlComponents: URLComponents) {
        guard let host = urlComponents.host else {
            return
        }
        action(host)
        for children in childrens where children.canHandleDeepLink(urlComponents){
            children.handleDeepLink(urlComponents)
        }
    }
    
}
