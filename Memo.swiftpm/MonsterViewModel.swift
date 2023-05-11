//
//  DraggableItem.swift
//  Memo
//
//  Created by mccl on 15/04/23.
//

import SwiftUI

struct MonsterViewModel: View {
        
    var imageName: String
    var index: Int
    
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
                
                
        }
    }
}

struct MonsterViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MonsterViewModel(imageName: "pink-monster", index: 0, width: 150)
    }
}
