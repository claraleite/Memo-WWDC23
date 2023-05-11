//
//  MenuView.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

// ORIENTATION: This experience was built to work on landscape left or right :)

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                BackgroundViewModel(imageName: "intro")
                
                VStack {
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.5)
                    
                    NavigationLink(
                        destination: {
                            OnboardingView()
                        }, label: {
                            Text("START")
                                .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight: .semibold, design: .default))
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .foregroundColor(Color("pink-200"))
                                )
                        }
                    )
                    
                    
                    
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink(
                            destination: {
                                CreditsView()
                            }, label: {
                                Text("CREDITS")
                                    .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                                    .foregroundColor(Color("purple-100"))
                                    .font(.system(size: 24, weight: .semibold, design: .default))
                                    .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color("purple-100"), lineWidth: 5)
                                            )
                            }
                        )
                        
                        Spacer()
                        
                        Text("This experience is better suited for Landscape Orientation! :)")
                            .font(.system(size: geometry.size.width > geometry.size.height ? geometry.size.height * 0.025 : geometry.size.width * 0.025, weight: .semibold, design: .default))
                            .foregroundColor(Color("purple-100"))
                            .frame(width: geometry.size.width * 0.25)
                            .multilineTextAlignment(.trailing)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                            

                        
                    }
                    
                }.padding(geometry.size.height * 0.05)
                
                
            }.ignoresSafeArea()
        }
        
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
