//
//  BabblyImageViewModel.swift
//  Memo
//
//  Created by mccl on 18/04/23.
//

import SwiftUI

struct BabblyImageViewModel: View {
    
    var imageName: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}

struct BabblyImageViewModel_Previews: PreviewProvider {
    static var previews: some View {
        BabblyImageViewModel(imageName: "babbly", width: 200, height: 200)
    }
}
