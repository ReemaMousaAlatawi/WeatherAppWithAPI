//
//  WeatherModel.swift
//  weather
//
//  Created by Reema Mousa on 09/09/1443 AH.
//

import Foundation


struct WeatherModel  {
    let condetionId:Int
    let cityName : String
    let temperature  :Double
    
    var temperatureString:String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName : String {
        switch condetionId {
        case 200...232 :
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzl"
        case 500...531 :
            return "cloud.rain"
        case 600...622 :
            return "cloud.snow"
        case 701...781 :
            return "cloud.fog"
        case 800 :
            return "sun.max"
        case 801...804 :
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
      
    }
}
