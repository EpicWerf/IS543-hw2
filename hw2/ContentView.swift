//
//  ContentView.swift
//  hw2
//
//  Created by IS 543 Student on 9/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var fibonacciInput: Int = 0
    @State var fibonacciAnswer: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Stepper(value: $fibonacciInput,
                        in: 0...100,
                        label: {
                    Text("Number to Calculate: \(self.fibonacciInput)")
                })
            }
            HStack{
                Button("Calc Fibonacci",
                       action: {Fibonacci(num: fibonacciInput)}
                )
                .buttonStyle(.bordered)
                Text("Fibonacci answer is \(self.fibonacciAnswer)")
            }
        }
        Divider()
        .padding()
    }
    
    func Fibonacci(num: Int) -> Void {
        var x = 0
        var y = 1
        var z = 0
        var i = 2
        while i < num {
            z = x + y;
            x = y;
            y = z;
            
            i = i + 1;
        }
        fibonacciAnswer = y
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


