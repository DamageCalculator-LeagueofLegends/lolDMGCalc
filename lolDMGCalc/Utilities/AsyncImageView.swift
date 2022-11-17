//
//  AsyncImageView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 16.11.22.
//

import SwiftUI

struct AsyncImageView: View {
    let url: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .cornerRadius(size/10)
            },
            placeholder: {
                EmptyImageView(size: size, clickable: false)
                
            }
        )
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: "", size: 50)
    }
}
