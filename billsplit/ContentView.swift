//
//  ContentView.swift
//  billsplit
//
//  Created by sam on 2022-04-04.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = 0.0
    @State var noPeople = 0
    @State var tip = 0
    
    var totalpp: Double {
        return ((100 + Double(tip)) / 100) * checkAmount / Double(noPeople + 2)
    }
    
    let tips = [0, 10, 15, 18, 20, 25]
    
    @FocusState private var amountFocus: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check amount: ", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountFocus)
                    Picker("Number of People", selection: $noPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tip) {
                        ForEach(tips, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much is the left amount")
                }
                
                Section {
                    Text(totalpp, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("the amounts after")
                }
            }
            .navigationTitle("details")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountFocus = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
