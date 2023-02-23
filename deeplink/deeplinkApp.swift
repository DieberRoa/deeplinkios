//
//  deeplinkApp.swift
//  deeplink
//
//  Created by Dieber A Roa M on 22/02/23.
//

import SwiftUI

@main
struct deeplinkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text( url.absoluteString )
                    }
                    .padding()
                }
        }
    }
}
