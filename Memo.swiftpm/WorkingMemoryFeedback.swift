//
//  WorkingMemoryFeedback.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

import SwiftUI

struct WorkingMemoryFeedback: View {
    
    @State var countView: Int = 0
    
    var numberOfPoints: Int
    
    @State var lastView: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                BackgroundViewModel(imageName: "bg-second-game-outro")
                
                if countView < 4 {
                    
                    if numberOfPoints < 3 {
                        
                        VStack {
                            Image("hm")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.5)
                                
                            ZStack(alignment: .bottom) {
                                
                                ZStack {
                                    
                                    Image("congrats-4")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.3)
                                    
                                    Text(numberOfPoints == 1 ? "You got \(numberOfPoints) item at the correct position." : "You got \(numberOfPoints) items at the correct position.")
                                        .frame(width: geometry.size.width * 0.25)
                                        .font(.system(size: geometry.size.width * 0.02, weight: .semibold, design: .default))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                
                                Image("congrats-4-monster")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.3)
                                
                                
                            }
                            
                            
                        }
                        
                    } else if numberOfPoints > 2 && numberOfPoints < 7 {
                        
                        VStack {
                            Image("nice")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.5)
                                
                            ZStack(alignment: .bottom) {
                                
                                ZStack {
                                    
                                    Image("congrats-5")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.3)
                                    
                                    Text("You got \(numberOfPoints) items at the correct position.")
                                        .frame(width: geometry.size.width * 0.25)
                                        .font(.system(size: geometry.size.width * 0.02, weight: .semibold, design: .default))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                
                                Image("congrats-5-monster")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.3)
                                
                                
                            }
                            
                            
                        }
                        
                    } else {
                        
                        VStack {
                            Image("wow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.5)
                                
                            ZStack(alignment: .bottom) {
                                
                                ZStack {
                                    
                                    Image("congrats-6")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.3)
                                    
                                    Text("You got all items at the correct position.")
                                        .frame(width: geometry.size.width * 0.25)
                                        .font(.system(size: geometry.size.width * 0.02, weight: .semibold, design: .default))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                
                                Image("congrats-6-monster")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.3)
                                
                                
                            }
                            
                            
                        }
                        
                    }
                }
                
                VStack {
                    
                    if countView > 3 {
                        
                        ZStack {
                        
                        
                            VStack {
                                Image("popup-second-game-\(countView)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.5)
                                    .offset(x: geometry.size.width * 0.1, y: geometry.size.height * 0.1)
                                
                                BabblyImageViewModel(imageName: countView % 2 == 0 ? "babbly talking 1" : "babbly talking 2", width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                                    .offset(x: -geometry.size.width * 0.2, y: geometry.size.height * 0.05)
                                
                                
                                
                            }
                            
                            if lastView {
                                NavigationButtonViewModel(nextView: FinalExplanation(), text: "DONE")
                                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                                
                            } else {
                                Button {
                                    countView += 1
                                    if countView == 7 {
                                        lastView = true
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
                                .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                            }
                            
                            
                        }
                        
                    }
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    countView = 4
                }
            }
        }
        
        
        
    }
}

struct WorkingMemoryFeedback_Previews: PreviewProvider {
    static var previews: some View {
        WorkingMemoryFeedback(numberOfPoints: 4)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
