//
//  FinalExplanation.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

import SwiftUI

struct FinalExplanation: View {
    
    @State var countView: Int = 1
    
    @State var namesArray: [String] = ["Babbly", "Bobby", "Bubble", "Buffy"].shuffled()
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                BackgroundViewModel(imageName: "bg-third-game")
                
                    
                if countView <= 3 {
                    
                    ZStack {
                        
                        VStack {
                            
                            Image(countView == 1 ? "popup-third-game-1" : "popup-third-game-2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.35)
                                .offset(x: -geometry.size.width * 0.1, y: geometry.size.height * 0.15)
                            
                            BabblyImageViewModel(imageName: "babbly thinking", width: geometry.size.width * 0.25, height: geometry.size.width * 0.3)
                                .offset(x: -geometry.size.width * 0.3, y: geometry.size.height * 0.1)
                            
                        }
                        
                        Button {
                            countView += 1
                            
                            if countView == 2 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    countView = 3
                                }
                            }
                            
                            
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
                        .opacity(countView == 1 ? 1 : 0)
                        .allowsHitTesting(countView == 2 ? false : true)
                        .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                       
                        
                    }
                    
                    
                    if countView == 3 {
                        
                        VStack(spacing: 12) {
                            
                            HStack(spacing: 12) {
                                
                                Button {
                                    if namesArray[0] == "Babbly" {
                                        countView = 4
                                    } else {
                                        countView = 5
                                    }
                                } label: {
                                    Text(namesArray[0])
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold, design: .default))
                                        .background(
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .foregroundColor(Color("pink-200"))
                                        )
                                }
                                
                                Button {
                                    if namesArray[1] == "Babbly" {
                                        countView = 4
                                    } else {
                                        countView = 5
                                    }
                                } label: {
                                    Text(namesArray[1])
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold, design: .default))
                                        .background(
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .foregroundColor(Color("pink-200"))
                                        )
                                }
                                
                            }
                            
                            HStack(spacing: 12) {
                                
                                Button {
                                    if namesArray[2] == "Babbly" {
                                        countView = 4
                                    } else {
                                        countView = 5
                                    }
                                } label: {
                                    Text(namesArray[2])
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold, design: .default))
                                        .background(
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .foregroundColor(Color("pink-200"))
                                        )
                                }
                                
                                Button {
                                    if namesArray[3] == "Babbly" {
                                        countView = 4
                                    } else {
                                        countView = 5
                                    }
                                } label: {
                                    Text(namesArray[3])
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold, design: .default))
                                        .background(
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .foregroundColor(Color("pink-200"))
                                        )
                                }
                                
                            }
                            
                        }.position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.6)
                        
                    }
                }
                
                if countView == 4 {
                    
                    ZStack {
                        
                        VStack {
                            
                            Image("popup-feedback-third-game-1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.4)
                                .offset(x: 0, y: geometry.size.height * 0.15)
                            
                            BabblyImageViewModel(imageName: "babbly happy", width: geometry.size.width * 0.4, height: geometry.size.width * 0.3)
                                .offset(x: -(geometry.size.width * 0.2), y: geometry.size.height * 0.1)
                            
                            
                        }
                        
                        Button {
                            countView = 6

                        } label: {
                            Text("NEXT")
                                .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold, design: .default))
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .foregroundColor(Color("pink-200"))
                                )
                        }.position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                    }
                    
                }
                
                if countView == 5 {
                    
                    ZStack {
                        
                        VStack {
                            
                            Image("popup-feedback-third-game-2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.4)
                                .offset(x: 0, y: geometry.size.height * 0.15)
                            
                            BabblyImageViewModel(imageName: "babbly sad", width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                                .offset(x: 0, y: geometry.size.height * 0.1)
                            
                        }
                        
                        Button {
                            countView = 6

                        } label: {
                            Text("NEXT")
                                .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold, design: .default))
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .foregroundColor(Color("pink-200"))
                                )
                        }.position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                    }
                    
                }
                
                if countView == 6 {
                    
                    ZStack {
                        
                        VStack {
                            
                            Image("popup-feedback-third-game-3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.5)
                                .offset(x: 0, y: geometry.size.height * 0.14)
                            
                            Image("babbly arm down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                                .offset(x: 0, y: geometry.size.height * 0.1)
                        
                            
                        }
                        
                        NavigationButtonViewModel(nextView: OutroView(), text: "NEXT")
                            .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                    }
                    
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct FinalExplanation_Previews: PreviewProvider {
    static var previews: some View {
        FinalExplanation()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
