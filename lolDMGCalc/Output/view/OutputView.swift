//
//  OutputView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 18.11.22.
//

import SwiftUI

struct OutputView: View {
    @ObservedObject var vm: ViewModel
    
    private let flexibleCouloums = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
    ]
    var body: some View {
        VStack(spacing: 5) {
            Text("Damage dealt:")
            LazyVGrid(columns: flexibleCouloums, alignment: .leading, spacing: 5) {
                Text("Total:")
                Text("True:")
                Text("Physical:")
                Text("Magic:")
                Text(String(format: "%.1f", vm.output.totalDamage))
                Text(String(format: "%.1f", vm.output.trueDamage))
                Text(String(format: "%.1f", vm.output.physicalDamage))
                Text(String(format: "%.1f", vm.output.magicDamage))
            }
            .padding(.horizontal, 8)
        }
        .padding(4)
        .background(.opacity(0.2))
        .cornerRadius(8)
        
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView(vm: Mock.vm)
    }
}
