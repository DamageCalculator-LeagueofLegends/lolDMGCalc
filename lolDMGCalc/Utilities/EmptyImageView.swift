//
//  EmptyImageView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 16.11.22.
//

import SwiftUI

struct EmptyImageView: View {
    let size: CGFloat
    var clickable: Bool = true

    var body: some View {
        if clickable {
            Image(systemName: "circle")
                .font(.system(size: size/1.5))
                .foregroundColor(.accentColor)
                .frame(width: size, height: size)
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
        } else {
            Rectangle()
                .frame(width: size, height: size)
                .foregroundColor(.gray.opacity(0.4))
                .cornerRadius(10)
        }
        
    }
}

struct EmptyImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EmptyImageView(size: 90)
            EmptyImageView(size: 90, clickable: false)
        }
    }
}
