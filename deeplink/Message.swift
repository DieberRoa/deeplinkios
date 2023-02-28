//
//  Product.swift
//  deeplink
//
//  Created by Dieber Roa M on 27/02/23.
//

import SwiftUI

struct MessageToShow : Identifiable {
    var message : String
    var id : Int
}

struct MessageView : View {
    @State var messageToShow : MessageToShow
    
    init(id: Int){
        self.messageToShow = MessageToShow(
            message: "Mensaje \(id)",
            id: id
        )
    }
    
    var body: some View {
        VStack {
            Text(messageToShow.message)
                .navigationTitle(messageToShow.message)
            Spacer()
        }
    }
}
