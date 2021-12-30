//
//  ContentView.swift
//  Conversion
//
//  Created by Arjun on 2021-04-23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTemp = ""
    @State private var baseUnit = 0
    @State private var convUnit = 0
    
    let units = ["° C", "° F", "K"]
    
    var convert: Double {
        
        let current = Double(currentTemp) ?? 0
        let unitSelection = String(units[baseUnit])
        let unitConversion = String(units[convUnit])
        
        if unitConversion == "° C" {

            if unitSelection == "° F" {

                let fToc = (current - 32) * (5 / 9)
                return fToc

            }else if unitSelection == "K" {

                let kToc = current - 273.15
                return kToc
            }
            else {
                return current
            }
        }
        
        if unitConversion == "° F" {

            if unitSelection == "° C" {

                let cTof = (current * (9 / 5)) + 32
                return cTof
            }
            else if unitSelection == "K" {

                let kTof = (current - 273.15) * (9 / 5) + 32
                return kTof
            }
            else {
                return current
            }
        }

        if unitConversion == "K" {

            if unitSelection == "° C" {
                
                let cTok = current + 273.15
                return cTok
            }
            else if unitSelection == "° F" {
                
                let fTok = (current - 32) * (5 / 9) + 273.15
                return fTok
            }
            else {
                return current
            }
        }
        else {
            return current
        }
    }
        
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Current Temperature", text: $currentTemp)
                        .keyboardType(.decimalPad)
                    Picker("Units?", selection: $baseUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("What unit would you like to conver to?")) {
                    Picker("Units?", selection: $convUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("The temperature in " + String(units[convUnit]) + " is")) {
                    Text("\(convert, specifier: "%.2f")")
                }
            }
            
            .navigationBarTitle("Conversion")
        } 
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
