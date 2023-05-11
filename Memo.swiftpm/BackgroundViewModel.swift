//
//  BackgroundModel.swift
//  Memo
//
//  Created by mccl on 10/04/23.
//

import SwiftUI

struct BackgroundViewModel: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .ignoresSafeArea(.all, edges: .all)
        
    }
}
