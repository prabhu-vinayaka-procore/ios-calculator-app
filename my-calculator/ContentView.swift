//
//  ContentView.swift
//  my-calculator
//
//  Created by Vinayaka Prabhu on 12/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var previousNumber: Double = 0
    @State private var currentNumber: Double = 0
    @State private var operation: String = ""
    @State private var userIsTyping = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Display
            HStack {
                Spacer()
                Text(display)
                    .font(.system(size: 60, weight: .light))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(height: 100)
            .background(Color.black)
            
            // Button Grid
            VStack(spacing: 12) {
                // Row 1: Clear, +/-, %, ÷
                HStack(spacing: 12) {
                    CalculatorButton(title: "C", backgroundColor: .gray, action: {
                        clear()
                    })
                    CalculatorButton(title: "±", backgroundColor: .gray, action: {
                        toggleSign()
                    })
                    CalculatorButton(title: "%", backgroundColor: .gray, action: {
                        percentage()
                    })
                    CalculatorButton(title: "÷", backgroundColor: .orange, action: {
                        performOperation("÷")
                    })
                }
                
                // Row 2: 7, 8, 9, ×
                HStack(spacing: 12) {
                    CalculatorButton(title: "7", backgroundColor: .darkGray, action: {
                        numberPressed("7")
                    })
                    CalculatorButton(title: "8", backgroundColor: .darkGray, action: {
                        numberPressed("8")
                    })
                    CalculatorButton(title: "9", backgroundColor: .darkGray, action: {
                        numberPressed("9")
                    })
                    CalculatorButton(title: "×", backgroundColor: .orange, action: {
                        performOperation("×")
                    })
                }
                
                // Row 3: 4, 5, 6, -
                HStack(spacing: 12) {
                    CalculatorButton(title: "4", backgroundColor: .darkGray, action: {
                        numberPressed("4")
                    })
                    CalculatorButton(title: "5", backgroundColor: .darkGray, action: {
                        numberPressed("5")
                    })
                    CalculatorButton(title: "6", backgroundColor: .darkGray, action: {
                        numberPressed("6")
                    })
                    CalculatorButton(title: "-", backgroundColor: .orange, action: {
                        performOperation("-")
                    })
                }
                
                // Row 4: 1, 2, 3, +
                HStack(spacing: 12) {
                    CalculatorButton(title: "1", backgroundColor: .darkGray, action: {
                        numberPressed("1")
                    })
                    CalculatorButton(title: "2", backgroundColor: .darkGray, action: {
                        numberPressed("2")
                    })
                    CalculatorButton(title: "3", backgroundColor: .darkGray, action: {
                        numberPressed("3")
                    })
                    CalculatorButton(title: "+", backgroundColor: .orange, action: {
                        performOperation("+")
                    })
                }
                
                // Row 5: 0 (wide), ., =
                HStack(spacing: 12) {
                    // Zero button (double width)
                    Button(action: {
                        numberPressed("0")
                    }) {
                        Text("0")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 168, height: 70)
                            .background(Color.darkGray)
                            .cornerRadius(35)
                    }
                    
                    CalculatorButton(title: ".", backgroundColor: .darkGray, action: {
                        decimalPressed()
                    })
                    
                    CalculatorButton(title: "=", backgroundColor: .orange, action: {
                        equals()
                    })
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    // MARK: - Calculator Functions
    
    private func numberPressed(_ number: String) {
        if userIsTyping {
            if display.count < 9 {
                display = display + number
            }
        } else {
            display = number
            userIsTyping = true
        }
    }
    
    private func decimalPressed() {
        if !display.contains(".") {
            if userIsTyping {
                display = display + "."
            } else {
                display = "0."
                userIsTyping = true
            }
        }
    }
    
    private func clear() {
        display = "0"
        previousNumber = 0
        currentNumber = 0
        operation = ""
        userIsTyping = false
    }
    
    private func toggleSign() {
        if display != "0" {
            if display.hasPrefix("-") {
                display.removeFirst()
            } else {
                display = "-" + display
            }
        }
    }
    
    private func percentage() {
        if let number = Double(display) {
            let result = number / 100
            display = formatNumber(result)
            userIsTyping = false
        }
    }
    
    private func performOperation(_ op: String) {
        if let number = Double(display) {
            currentNumber = number
            
            if !operation.isEmpty && userIsTyping {
                equals()
            }
            
            operation = op
            previousNumber = currentNumber
            userIsTyping = false
        }
    }
    
    private func equals() {
        if let number = Double(display) {
            currentNumber = number
            
            var result: Double = 0
            
            switch operation {
            case "+":
                result = previousNumber + currentNumber
            case "-":
                result = previousNumber - currentNumber
            case "×":
                result = previousNumber * currentNumber
            case "÷":
                if currentNumber != 0 {
                    result = previousNumber / currentNumber
                } else {
                    display = "Error"
                    return
                }
            default:
                return
            }
            
            display = formatNumber(result)
            operation = ""
            userIsTyping = false
        }
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } else {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 8
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: number)) ?? String(number)
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(backgroundColor)
                .cornerRadius(35)
        }
    }
}

// MARK: - Color Extensions
extension Color {
    static let darkGray = Color(red: 0.2, green: 0.2, blue: 0.2)
}

#Preview {
    ContentView()
}
