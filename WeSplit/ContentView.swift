//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhananjay Magdum on 27/02/21.
//  Copyright © 2021 Atlas Copco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State var name = ""
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    @State private var selectedStudent = 0
    let tipPercentages = [10,20,30,40,50]
    var totalPerPerson: Double {
        let noOfPeople = Double(numberOfPeople) ?? 0
    let peopleCount = Double(noOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let amount = Double(checkAmount)  ?? 0
    let tipValue = amount/100*tipSelection
    let totalAmount = amount + tipValue
    let amountPerson = totalAmount / peopleCount
    return amountPerson
    }
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let amount = Double(checkAmount)  ?? 0
        let tipValue = amount/100*tipSelection
        let totalAmount = amount + tipValue
        return totalAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField ("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Total Number of People", text: $numberOfPeople)
//                    Picker("Number of People", selection: $numberOfPeople) {
//                        ForEach (2..<100) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total Amount including Tip")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                    }
            }
            .navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
