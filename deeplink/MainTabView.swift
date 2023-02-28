//
//  MainTabView.swift
//  deeplink
//
//  Created by Dieber Roa M on 27/02/23.
//

import SwiftUI

struct TabRepresentation: Identifiable {
    var title: String
    var view: AnyView
}

extension TabRepresentation {
    var id: String { return title }
}

struct MainTabView: View {
    @State var tabs: [TabRepresentation]
    @Binding var selectedTab: String

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs) { tab in
                tab.view
                    .tabItem {
                        Text(tab.title)
                    }
                    .tag(tab.title)
            }
        }
    }
}


extension View {
    var asAnyView: AnyView {
        return AnyView(self)
    }
}
