//
//  ContentView.swift
//  SwiftUICaculator
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

class CalcViewModel: ObservableObject {
    
    @Published var result = "0"
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var currentOperation: CalcOperation = .none
    var runningNum = 0
    
    func didTapBtn(calcBtn: CalcButton) {
        switch calcBtn {
        case .add, .subtract, .mutliply, .divide, .equal:
            if calcBtn == .add {
                currentOperation = .add
                runningNum = Int(result) ?? 0
            } else if calcBtn == .subtract {
                currentOperation = .subtract
                runningNum = Int(result) ?? 0
            } else if calcBtn == .mutliply {
                currentOperation = .mutliply
                runningNum = Int(result) ?? 0
            } else if calcBtn == .divide {
                currentOperation = .divide
                runningNum = Int(result) ?? 0
            } else if calcBtn == .equal {
                let current = Int(result) ?? 0
                switch currentOperation {
                case .add:
                    result = "\(current + runningNum)"
                case .subtract:
                    result = "\(current - runningNum)"
                case .mutliply:
                    result = "\(current * runningNum)"
                case .divide:
                    result = "\(current / runningNum)"
                case .none:
                    break
                }
            }
            if calcBtn != .equal {
                result = "0"
            }
            break
        case .clear:
            result = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = calcBtn.rawValue
            if result == "0" {
                result = number
            } else {
                result += number
            }
        }
    }
}

enum CalcButton: String {
    
    case clear = "AC", percent = "%", negative = "-/+"
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", decimal = "."
    case add = "+", subtract = "-", divide = "/", mutliply = "x", equal = "="
    
    var buttonColor: Color {
        switch self {
        case .clear, .percent, .negative:
            return Color(.lightGray)
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        default:
            return Color(UIColor(displayP3Red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
        }
    }
}

enum CalcOperation {
    case add, subtract, divide, mutliply, none
}

struct ContentView: View {
    
    @ObservedObject var calcViewModel = CalcViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(calcViewModel.result)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(calcViewModel.buttons, id: \.self) { row in
                    
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            
                            Button(action: {
                                calcViewModel.didTapBtn(calcBtn: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: itemWidth(item: item), height: itemHeight(item: item))
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(itemWidth(item: item) / 2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func itemWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2 + 12 / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    func itemHeight(item: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
