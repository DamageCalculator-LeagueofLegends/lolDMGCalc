//
//  ImageService.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

class ImageService {
    public func getImage(for urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }

        do {
            let data = try Data(contentsOf: url)

            return UIImage(data: data)
        } catch {
            print("Error \(error)")
        }
        return nil
    }
}
