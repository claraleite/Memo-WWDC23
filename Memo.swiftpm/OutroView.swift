//
//  OutroView.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

import SwiftUI

struct OutroView: View {
    
    @State var lastView: Bool = false
    
    @State var popupShowing: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                BackgroundViewModel(imageName: "outro-1")
                
                VStack {
                    
                    Image("popup-outro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.5)
                        .offset(x: geometry.size.width * 0.1, y: geometry.size.height * 0.12)
                    
                    
                    BabblyImageViewModel(imageName: "babbly outro", width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                        .offset(x: -geometry.size.width * 0.15, y: geometry.size.height * 0.1)
                
                    
                    
                }
                
                
                if lastView {
                    
                    BackgroundViewModel(imageName: "outro-2")
                    
                    VStack(spacing: geometry.size.height * 0.05) {
                        
                        ZStack {
                            Image("frame")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.5)
                            
                            Text("“What we process, we learn. If we're not processing life, we're not living it. Live life.”")
                                .frame(width: geometry.size.width * 0.35)
                                .font(.system(size: 32, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        
                        ZStack {
                            Image("credits")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.3)
                            
                            Text("Doolittle, P. [TED]. (2013). How your \"working memory\" makes sense of the world.")
                                .frame(width: geometry.size.width * 0.2)
                                .font(.system(size: 10, weight: .regular, design: .default))
                                .foregroundColor(Color("purple-200"))
                                .multilineTextAlignment(.center)
                        }
                    
                        
                    }
                    
                }
                
                Button {
                    if lastView {
                        PopToRootModel.popToRootView()
                    } else {
                        lastView = true
                    }
                
                } label: {
                    Text(lastView ? "HOME" : "DONE")
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

        }
        
        
    }
}

struct OutroView_Previews: PreviewProvider {
    static var previews: some View {
        OutroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
