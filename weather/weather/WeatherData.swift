//
//  WeatherData.swift
//  weather
//
//  Created by Reema Mousa on 02/08/1443 AH.
//

import Foundation

struct WeatherData : Codable{
    let name:String
    let main : Main
    let weather: [Weather]
}


struct Main : Codable {
    let temp : Double
}

struct Weather  : Codable{
    let id : Int
    
}
