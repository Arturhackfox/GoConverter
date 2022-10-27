//
//  ContentView.swift
//  UnitConversion
//
//  Created by Arthur Sh on 26.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentNumber: Double = 0
    @State private var currentUnit = "Kilometers"
    @State private var convertTo = "Minutes"
    @FocusState private var isFocused: Bool
    
    var convertedValue:Double {
        
        let chosen1 = currentUnit
        let chosen2 = convertTo
        
        var finalChosen = 0.0
        
       
      
        if chosen1 == "Kilometers" && chosen2 == "Feet" {
            finalChosen = currentNumber * 3281
        } else if chosen1 == "Kilometers" && chosen2 == "Yard" {
            finalChosen = currentNumber * 1094
        } else if chosen1 == "Kilometers" && chosen2 == "Miles"{
            finalChosen = currentNumber / 1.609
        } else if chosen1 == "Feet" && chosen2 == "Kilometers" {
            finalChosen = currentNumber / 3281
        } else if chosen1 == "Feet" && chosen2 == "Yard" {
            finalChosen = currentNumber / 3
        }  else if chosen1 == "Feet" && chosen2 == "Miles" {
            finalChosen = currentNumber / 5280
        } else if chosen1 == "Yard" && chosen2 == "Kilometers" {
            finalChosen = currentNumber / 1094
        } else if chosen1 == "Yard" && chosen2 == "Feet" {
            finalChosen = currentNumber * 3
        } else if chosen1 == "Yard" && chosen2 == "Miles" {
            finalChosen = currentNumber / 1760
        } else if chosen1 == "Miles" && chosen2 == "Kilometers" {
            finalChosen = currentNumber * 1.609
        } else if chosen1 == "Miles" && chosen2 == "Feet" {
            finalChosen = currentNumber * 5280
        } else if chosen1 == "Miles" && chosen2 == "Yard" {
            finalChosen = currentNumber * 1760
        }
        return finalChosen
    }
   
    let units = ["Kilometers", "Feet", "Yard", "Miles"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Convert your value", value: $currentNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Select input unit", selection: $currentUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    Picker("Select output unit", selection: $convertTo){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    
                    Text(convertedValue, format: .number)
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
            .navigationTitle("📏Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
