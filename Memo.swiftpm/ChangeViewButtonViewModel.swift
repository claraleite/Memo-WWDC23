//
//  ChangeViewButtonViewModel.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

import SwiftUI

struct ChangeViewButtonViewModel: View {
    var text: String
    @State var countView: Int
    var destinationCountView: Int
    
    var body: some View {
        Button {
            if text == "Babbly" {
                countView = destinationCountView
            }
        } label: {
            Text(text)
                .frame(width: 150, height: 60)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .semibold, design: .default))
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(Color("pink-200"))
                )
        }
    }
}

struct ChangeViewButtonViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ChangeViewButtonViewModel(text: "NEXT", countView: 0, destinationCountView: 1)
    }
}
