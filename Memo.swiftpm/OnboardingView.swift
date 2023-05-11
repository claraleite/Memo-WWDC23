//
//  NavigationButtonViewModel.swift
//  Memo
//
//  Created by mccl on 09/04/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var count: Int = 0
    @State var secondView: Bool = false
    @State var popupImage: String = "popup-intro-1"
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                BackgroundViewModel(imageName: "bg-intro")
                
                VStack {
                    
                    Text("How many times did you enter a room and instantly forget what you were there for?")
                        .frame(width: geometry.size.width * 0.7)
                        .font(.system(size: 32, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        
                        Image(secondView ? "popup-intro-2" : "popup-intro-1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.5)
                            .offset(x: geometry.size.width * 0.1, y: geometry.size.height * 0.1)
                        
                        BabblyImageViewModel(imageName: secondView ? "babbly arm down" : "babbly", width: geometry.size.width * 0.5, height: geometry.size.width * 0.3)
                            .offset(x: -(geometry.size.width * 0.2), y: geometry.size.height * 0)
                            .animation(.spring(response: 0.8, dampingFraction: 0.45, blendDuration: 0.5), value: secondView)
                        
                    
                    
                }
                }
                
                if secondView {
                    NavigationButtonViewModel(nextView: ShortTermMemoryGame(), text: "START")
                        .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                    
                } else {
                    Button {
                        secondView = true
                    } label: {
                        Text("NEXT")
                            .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold, design: .default))
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .foregroundColor(Color("pink-200"))
                            )
                    }
                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
