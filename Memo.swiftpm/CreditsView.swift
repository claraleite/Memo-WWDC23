//
//  CreditsView.swift
//  Memo
//
//  Created by mccl on 18/04/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                BackgroundViewModel(imageName: "bg-credits")
                
                ScrollView {
                    
                    
                    VStack(spacing: geometry.size.height * 0.05) {
                        
                        Image("credits-title")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.4)
                        
                        VStack(spacing: geometry.size.height * 0.02) {
                            
                            Group {
                                
                                Text("Memo was created by Maria Clara Cavalcanti Leite in Recife, Pernambuco, Brazil in April 2023.")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .semibold, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                
                                Text("This project is based on classes that my grandmother gives to elderly women here in Recife, called “Memory Workshop”. There, she does dynamics on how to improve memory and work on it so you don't lose what's most precious. Thanks, vovis!")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                Text("The TED Talk that most motivated me to work on this theme was “How your working memory makes sense of the world”, by Peter Doolittle.")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    
                                    VStack(spacing: geometry.size.height * 0.02) {
                                        
                                        Text("Sounds")
                                            .font(.system(size: geometry.size.height * 0.04, weight: .bold, design: .default))
                                            .frame(width: geometry.size.width * 0.5)
                                            .foregroundColor(Color("purple-200"))
                                            .multilineTextAlignment(.center)
                                        
                                        
                                        Text("The sounds used in this experiment were made by me, Clara, messing around in GarageBand, using its Tambourine and Marimba Sound Packs.")
                                            .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                            .frame(width: geometry.size.width * 0.35)
                                            .multilineTextAlignment(.center)
                                        
                                        
                                        Text("Illustrations")
                                            .font(.system(size: geometry.size.height * 0.04, weight: .bold, design: .default))
                                            .frame(width: geometry.size.width * 0.5)
                                            .foregroundColor(Color("purple-200"))
                                            .multilineTextAlignment(.center)
                                        
                                        
                                        Text("The drawings and the handmade titles were also created by me on Figma and Adobe Illustrator, but of course I had inspiration from websites such as Behance, Pinterest and Freepik.")
                                            .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                            .frame(width: geometry.size.width * 0.35)
                                            .multilineTextAlignment(.center)
                                        
                                    }
                                    
                                    VStack(spacing: geometry.size.height * 0.02) {
                                        
                                        Text("Coding")
                                            .font(.system(size: geometry.size.height * 0.04, weight: .bold, design: .default))
                                            .frame(width: geometry.size.width * 0.5)
                                            .foregroundColor(Color("purple-200"))
                                            .multilineTextAlignment(.center)
                                        
                                        
                                        Text("I should give special thanks to the Swift community for sharing so much knowledge and putting so many things out there. Specifically the PopRootModel code I got on Lopau based on a Stackoverflow code posted some years ago, and it's available at: https://www.lopau.com/how-to-solve-windows-was-deprecated-in-ios-15-0-use-uiwindowscene-windows-on-a-relevant-window-scene-instead-warning-in-swift/")
                                            .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                            .frame(width: geometry.size.width * 0.35)
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                        
                                    }
                                }
                                
                               
                                
                               
                            Group {
                                
                                Text("References")
                                    .font(.system(size: geometry.size.height * 0.04, weight: .bold, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .foregroundColor(Color("purple-200"))
                                    .multilineTextAlignment(.center)
                                
                                Text("Everything that Babbly teaches us was found in articles about short-term memory and working memory, mostly focused on Baddeley's model of working memory and Atkinson-Shiffrin memory model.")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                Text("Questioning short-term memory and its measurement: Why digit span measures long-term associative learning, Gary Jones, 2015")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .semibold, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                Text("Available on: https://www.sciencedirect.com/science/article/pii/S0010027715300354")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                Text("Working memory, Alan Baddeley, 2010")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .semibold, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                Text("Available on: https://www.sciencedirect.com/science/article/pii/S0960982209021332")
                                    .font(.system(size: geometry.size.width * 0.015, weight: .regular, design: .default))
                                    .frame(width: geometry.size.width * 0.5)
                                    .multilineTextAlignment(.center)
                                
                                
                                
                            }
                            
                        }
                        
                    }
                    .padding(EdgeInsets(top: geometry.size.height * 0.05, leading: 0, bottom: geometry.size.height * 0.05, trailing: 0))
                }
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
