//
//  RectangleViewModel.swift
//  Memo
//
//  Created by mccl on 18/04/23.
//

import SwiftUI

struct RectangleViewModel: View {
    var imageName: String
    var index: Int
    
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
            
            if imageName == "rectangle" {
                Text(String(index + 1))
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(Color("green-400"))
                
                    
            }
            
            if imageName == "rectangle-yellow" {
                Text(String(7 - index))
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(Color("yellow-400"))
            }
            
                
        }
    }
}

struct RectangleViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RectangleViewModel(imageName: "rectangle", index: 1, width: 150)
    }
}
