//
//  deeplinkApp.swift
//  deeplink
//
//  Created by Dieber A Roa M on 22/02/23.
//

import SwiftUI


class TabViewModel : ObservableObject {
    @Published var selectedTab: String = "Mensajes"
    @Published var parameter: String = ""
    
    
    
    func changeSelectedTab(selectedTab : String) {
        self.selectedTab = selectedTab
    }
    
    func changeParameter(parameter: String) {
        self.parameter = parameter
    }
}

@main
struct deeplinkApp: App {
    
    @StateObject var viewModel = TabViewModel()
    
    
    var tabRepresentations: [TabRepresentation] {
        return [
            .init(
                title: "Principal",
                view: Text("Principal")
                .asAnyView
            ),
            .init(
                title: "Configuraciones",
                view: Text("Configuraciones")
                    .asAnyView)
        ]
    }
    
    var body: some Scene {
        WindowGroup {
            VStack{
                Text("Parámetro: \(viewModel.parameter)")
                Spacer()
                MainTabView(
                    tabs: tabRepresentations,
                    selectedTab: $viewModel.selectedTab
                )
            }
            .onOpenURL { url in
                guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                    return
                }
                
                if components.path.contains("Configuraciones") {
                    viewModel.changeSelectedTab(selectedTab: "Configuraciones")
                } else {
                    if components.path.contains("detail") {
                        viewModel.changeSelectedTab(selectedTab: "Principal")
                        viewModel.changeParameter(parameter:  components.path.components(separatedBy: "/")[2])
                    }
                }
                

            }
        }
    }
}

