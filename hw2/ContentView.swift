//
//  ContentView.swift
//  hw2
//
//  Created by IS 543 Student on 9/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var iFibonacciInput: Int = 0
    @State var iFibonacciAnswer: Int = 0
    @State var iNFactInput: Int = 0
    @State var iNFactAnswer: Int = 0
    @State var iSumNum1: Int = 0
    @State var iSumNum2: Int = 0
    @State var iSumAnswer: Int = 0
    @State var iNumCents: Int = 100
    @State var sCentsAnswer: String = ""
    
    var body: some View {
        VStack {
            
            Group{
                // Fibonacci UI
                HStack {
                    Stepper(value: $iFibonacciInput,
                            in: 1...100,
                            label: {
                        Text("Number to Calculate: \(self.iFibonacciInput)")
                    })
                }
                HStack{
                    Button("Calc Fibonacci",
                           action: {fibonacci(num: iFibonacciInput)}
                    )
                    .buttonStyle(.bordered)
                    Text("Fibonacci answer is \(self.iFibonacciAnswer)")
                }
                
                Divider()
            }
            
            Group{
                // N Factorial UI
                HStack {
                    Stepper(value: $iNFactInput,
                            in: 0...100,
                            label: {
                        Text("Number to Calculate: \(self.iNFactInput)")
                    })
                }
                HStack{
                    Button("Calc N Factorial",
                           action: {nFactorial(iNFactInput: iNFactInput)}
                    )
                    .buttonStyle(.bordered)
                    Text("N Factorial answer is \(self.iNFactAnswer)")
                }
                
                Divider()
            }

            Group{
                // Sum of all numbers UI
                HStack {
                    Stepper(value: $iSumNum1,
                            in: 0...100,
                            label: {
                        Text("Num 1: \(self.iSumNum1)")
                    })
                }
                HStack {
                    Stepper(value: $iSumNum2,
                            in: iSumNum1...100,
                            label: {
                        Text("Num 2: \(self.iSumNum2)")
                    })
                }
                HStack{
                    Button("Calc Sum",
                           action: {sum(iSumNum1: iSumNum1, iSumNum2: iSumNum2)}
                    )
                    .buttonStyle(.bordered)
                    Text("Sum answer is \(self.iSumAnswer)")
                }
                Divider()
            }
            
            Group{
                //UI for number of cents
                HStack{
                    Stepper(value: $iNumCents,
                            in: 100...1000,
                            label: {
                        Text("Number of Cents: \(self.iNumCents)")
                    })
                }
                Button("Calc exact change",
                       action: {centsCalculator(iNumCents: iNumCents)}
                )
                .buttonStyle(.bordered)
                Text(sCentsAnswer)
            }
            
        }.padding()
    }
    
    // Compute the ith Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, …)
    func fibonacci(num: Int) -> Void {
        var x = 0
        var y = 1
        var z = 0
        var i = 2
        while i <= num {
            z = x + y
            x = y
            y = z
            
            i += 1
        }
        iFibonacciAnswer = y
    }
    
    // Compute n! (factorial) for integer n ≥ 0
    func nFactorial(iNFactInput: Int) -> Void {
        var iResult = 1
        var iNum = iNFactInput
        
        if iNum == 0 {
            iNFactAnswer = 1
        } else {
            while iNum != 0 {
                iResult = iResult * iNum
                iNum -= 1
            }
        }
                
        iNFactAnswer =  iResult
    }
    
    // Compute the sum of all integers between two given integers (inclusive)
    func sum(iSumNum1: Int, iSumNum2: Int) -> Void {
        let iNum1 = iSumNum1
        var iNum2 = iSumNum2
        
        if iNum2 > iNum1 {
            while iNum2 != (iNum1 - 1) {
                iSumAnswer = iSumAnswer + iNum2
                iNum2 -= 1
            }
        } else {
            iSumAnswer = 0
        }
    }
    
    // Given a number of cents, print to the browser console the corresponding U.S. coins that total to the given number.
    func centsCalculator(iNumCents: Int) {
        var iQuarters = 0
        var iDimes = 0;
        var iNickels = 0;
        var iPennies = 0;
        var sResponse = "";
        
        var iCents = iNumCents
                
        while iCents >= 25 {
            iQuarters += 1
//            iCents = iCents - 25
            iCents -= 25
        }
        while iCents >= 10 {
            iDimes += 1
            iCents = iCents - 10
        }
        while iCents >= 5 {
            iNickels += 1
            iCents = iCents - 5
        }
        while iCents >= 1 {
            iPennies += 1
            iCents = iCents - 1
        }
        
        sCentsAnswer = "\(iNumCents) cents turns into \(iQuarters) quarter(s), \(iDimes) dime(s), \(iNickels) nickel(s), and \(iPennies) penny(ies), "


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



