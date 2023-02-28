//
//  MessageList.swift
//  deeplink
//
//  Created by Dieber Roa M on 27/02/23.
//

import SwiftUI


protocol ViewWithIntId : View {
    init (id: Int)
}

struct MessageList<Destination: View> : View {
    
    @State var messageList: [MessageToShow]
    var destinationFactory : (Int) -> Destination
    
    @Binding var selectedId : Int?
    
    var body: some View {
        NavigationView {
            List(messageList) { message in
                NavigationLink (
                    tag: message.id,
                    selection: $selectedId,
                    destination : {
                        destinationFactory(message.id)
                    },
                    label: {
                        cell(message: message)
                    }
                )
            }
        }
    }
    
    func cell(message : MessageToShow) -> some View{
        return HStack {
            Text(message.message)
            Spacer()
            Text(String(message.id))
        }
    }
    
    
}
