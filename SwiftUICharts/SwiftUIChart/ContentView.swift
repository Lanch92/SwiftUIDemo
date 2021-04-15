//
//  ContentView.swift
//  SwiftUIChart
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 15) {
                // legend is optional
                LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", legend: "Full screen")
                
                MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Title")
                
                // legend is optional, use optional .padding()
//                LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen")
                
                // legend is optional
                BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Sales", legend: "Quarterly")
                
                // legend is optional
                BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", legend: "Legendary")
                
                BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", form: ChartForm.small)
                
                BarChartView(data: ChartData(points:[1.23,2.43,3.37]) ,title: "A", valueSpecifier: "%.2f")
                
                PieChartView(data: [8,23,54,32], title: "Title", legend: "Legendary") // legend is optional
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
