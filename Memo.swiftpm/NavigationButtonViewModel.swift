//
//  NavigationButtonViewModel.swift
//  Memo
//
//  Created by mccl on 15/04/23.
//

import SwiftUI

struct NavigationButtonViewModel: View {
    
    let nextView: any View
    var text: String
    
    var body: some View {
        NavigationLink(
            destination: {
                AnyView(nextView)
            }, label: {
                Text(text)
                    .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .foregroundColor(Color("pink-200"))
                    )
            }
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
