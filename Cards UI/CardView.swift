//
//  CardView.swift
//  Cards UI
//
//  Created by José Javier Cueto Mejía on 10/05/20.
//  Copyright © 2020 Pozolx. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - properties
    var gradient: [Color] = [Color("Color01"),Color("Color02")]
    
    var body: some View {
        ZStack{
            Image("developer-no1")
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("Better apps. Less code.")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
                Spacer()
                
                Button(action: {
                    print("tapped")
                }) {
                    HStack {
                        Text("Learn" .uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .accentColor(.white)
                        Image(systemName: "arrow.right.circle")
                            .font(Font.title.weight(.medium))
                            .accentColor(.white)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 24)
                    .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                }
            }.padding()
        }
        .frame(width: 335, height:545)
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}

