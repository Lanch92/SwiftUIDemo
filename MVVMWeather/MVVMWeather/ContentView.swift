//
//  ContentView.swift
//  MVVMWeather
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject  var weatherViewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text(weatherViewModel.weatherModel?.current.weather.first?.main ?? "-")
                    .font(.system(size: 32))
                
                Text(weatherViewModel.weatherModel?.current.weather.first?.weatherDescription ?? "-")
                    .font(.system(size: 44))
                
                Text("\(Int(weatherViewModel.weatherModel?.current.temp ?? 0.0))˚")
                    .font(.system(size: 24))
                
                Text(weatherViewModel.weatherModel?.timezone ?? "-")
                    .font(.system(size: 24))
            }
            .navigationTitle("MVVM Weather")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
