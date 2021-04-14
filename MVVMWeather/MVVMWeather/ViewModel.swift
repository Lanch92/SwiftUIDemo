//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by monkey on 2021/4/14.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherModel: WeatherModel?
    
    init() {
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=15.03&lon=102.67&exclude=hourly,daily,minutely&units=imperial&appid=84778a011c3507438a23d03592449e41")!
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("Something Wrong: \(error.debugDescription)")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.weatherModel = weather
                }
            }
            catch {
                print("Data Parse Error: \(error)");
            }
        }
        task.resume()
        
    }
}
