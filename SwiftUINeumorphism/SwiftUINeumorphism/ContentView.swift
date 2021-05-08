//
//  ContentView.swift
//  SwiftUINeumorphism
//
//  Created by monkey on 2021/5/8.
//  Neumorphism: http://www.woshipm.com/it/3775117.html

import SwiftUI

extension Color {

    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SampleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(
                                        Circle()
                                            .fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(
                                        Circle()
                                            .fill(LinearGradient(.clear, .black))
                                    )
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shap: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shap
                    .fill(LinearGradient(.darkEnd, .darkStart))
                    .overlay(shap.stroke(LinearGradient(.darkStart, .darkEnd), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shap
                    .fill(LinearGradient(.darkStart, .darkEnd))
                    .overlay(shap.stroke(Color.darkEnd, lineWidth: 4))
                    .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
                    .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
            }
        }
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shap: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shap
                    .fill(LinearGradient(.lightEnd, .lightStart))
                    .overlay(shap.stroke(LinearGradient(.lightStart, .lightEnd), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shap
                    .fill(LinearGradient(.darkStart, .darkEnd))
                    .overlay(shap.stroke(LinearGradient(.lightStart, .lightEnd), lineWidth: 4))
                    .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
                    .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shap: Circle())
            )
            .animation(nil)
    }
}

struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            configuration.label
                .padding(30)
                .contentShape(Circle())
                .background(
                    DarkBackground(isHighlighted: configuration.isOn, shap: Circle())
                )
        })
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shap: Circle())
            )
            .animation(nil)
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            configuration.label
                .padding(30)
                .contentShape(Circle())
                .background(
                    ColorfulBackground(isHighlighted: configuration.isOn, shap: Circle())
                )
        })
    }
}

struct ContentView: View {
    
    @State private var toggleIsOn = false
    
    var body: some View {
        ZStack {
//            Color.offWhite
            LinearGradient(.darkStart, .darkEnd)
            
//            RoundedRectangle(cornerRadius: 25.0)
//                .fill(Color.offWhite)
//                .frame(width: 300, height: 300)
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            VStack(spacing: 40) {
                Button(action: {
                    print("Button tapped")
                }, label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                })
                .buttonStyle(ColorfulButtonStyle())
                
                Toggle(isOn: $toggleIsOn, label: {
                    
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                })
                .toggleStyle(ColorfulToggleStyle())
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
