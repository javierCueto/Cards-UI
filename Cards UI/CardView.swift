//
//  CardView.swift
//  Cards UI
//
//  Created by José Javier Cueto Mejía on 10/05/20.
//  Copyright © 2020 Pozolx. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    @State private var fadeIn: Bool = false
    @State private var moveDown : Bool = false
    @State private var moveUp: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    //MARK: - properties
    
    var body: some View {
        ZStack{
            Image("\(card.imageName)")
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack {
                VStack {
                    Text(card.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Text(card.message)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .italic()
                }
                .offset(y: moveDown ? 0 : -30 )
                
                Spacer()
                
                Button(action: {
                    print("tapped")
                    self.hapticImpact.impactOccurred()
                    playSound(sound: "sound-chime", type: "mp3")
                    self.showAlert.toggle()
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
                    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                }
                .offset(y: moveUp ? 0 : 30)
            }.padding()
        }
        .frame(width: 335, height:545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(){
            withAnimation(.linear(duration: 1.2)){
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)){
                self.moveDown.toggle()
            }
            
            withAnimation(.linear(duration: 0.8)){
                self.moveUp.toggle()
            }
            
        }
        /*.alert(isPresented: $showAlert) {
            
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("Ok")))
        }*/
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[5])
            .previewLayout(.sizeThatFits)
    }
}

