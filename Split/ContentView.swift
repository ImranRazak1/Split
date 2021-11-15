//
//  ContentView.swift
//  Split
//
//  Created by Imran razak on 15/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 2
    @State private var tipAmount = 20
    
    let tipPercent = [10, 15, 20, 25, 0]
   
    var totalPerPersons: Double {
        let people = Double(numOfPeople + 2)
        let tip = Double(tipAmount)
              
        let tipValue =  checkAmount / 100 * tip
        let grandtotal = checkAmount + tipValue
        let amountPerPerson = grandtotal / people

        return amountPerPerson
    }
    
    var body: some View {
       
        NavigationView {
            
       
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .keyboardType(.decimalPad)
                Picker("Number of People", selection: $numOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                    
                }
                
                
                
            }
            Section {
                Picker("Tip Amount", selection: $tipAmount){
                    ForEach(tipPercent, id: \.self){
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Tip Percentage")
            }
            
            Section {
                Text(totalPerPersons, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
            } header: {
                Text("Total Per Person")
                    .font(.headline)
            }
           
            
        }
        .navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }

    }
}
