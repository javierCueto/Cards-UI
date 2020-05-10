//
//  ContentView.swift
//  Cards UI
//
//  Created by José Javier Cueto Mejía on 10/05/20.
//  Copyright © 2020 Pozolx. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - properties
    var cards: [Card] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center, spacing: 20){
                ForEach(cards){ item in
                    CardView(card: item)
            
                }
                
            }.padding(20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("iPhone 11 Pro")
    }
}
