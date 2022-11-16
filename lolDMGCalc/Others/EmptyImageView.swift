//
//  EmptyImageView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 16.11.22.
//

import SwiftUI

struct EmptyImageView: View {
    let size: CGFloat

    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(.gray.opacity(0.4))
            .cornerRadius(10)
    }
}

struct EmptyImageView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyImageView(size: 90)
    }
}
