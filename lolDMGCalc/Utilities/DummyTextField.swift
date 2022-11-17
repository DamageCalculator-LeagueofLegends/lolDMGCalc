//
//  DummyTextField.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct DummyTextField: View {
    @ObservedObject var vm: ViewModel
//    @Binding var value: Int = projectedValue; 0
    
    var body: some View {
        TextField("Health", value: $vm.dummy.health, format: .number)
            .keyboardType(.numberPad)
            .textFieldStyle(.roundedBorder)
            .frame(width: 75)
    }
}

struct DummyTextField_Previews: PreviewProvider {
    static var previews: some View {
        DummyTextField(vm: Mock.vm)
    }
}
