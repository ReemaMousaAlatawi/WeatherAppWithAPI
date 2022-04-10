//
//  weatherManeger.swift
//  weather
//
//  Created by Reema Mousa on 02/08/1443 AH.
//

import Foundation

protocol WeatherManagerDelegate{

    func didUpdateWeather(weatherMAneger : WeatherManager ,
                          weather : WeatherModel )
    
    func didFaileWithError(error : Error)

}


struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3785aa4324dab60f9b47853e216085a5&units=metric"
    

    func fitchWeather (cityName : String){
        let urlStrint = "\(weatherURL)&q=\(cityName)"
         performRequest(urlString: urlStrint)
        
    }
    
    
    func performRequest(urlString : String){
        //great URl
        if let url = URL(string: urlString){
            //great sesstion
            let session = URLSession(configuration: .default)
            // Give urlSisstion Task
            let task = session.dataTask(with: url){
                (data , respons , error) in
                if error != nil {

                    self.delegate?.didFaileWithError(error: error!)
                    return
                }
                if let saveData = data{
                    if let weather =  self.paresJSON(weatherData: saveData){
                        self.delegate?.didUpdateWeather(weatherMAneger: self, weather: weather)
 
                    }
                }
            }
            //start task
            task.resume()
        }
    }
 
    
    func paresJSON(weatherData:Data)-> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodeData = try  decoder.decode(WeatherData.self,
                                                 from: weatherData)

//            print("TEMP :***** \(decodeData.main.temp)")
            let id = decodeData.weather[0].id
            print("****** ID: \(id)")
            let temp = decodeData.main.temp
            print("****** TEMP :\(temp)")

            let name = decodeData.name
            print("****** NAME: \(name)")

            let weather = WeatherModel(condetionId: id,
                                       cityName: name,
                                       temperature: temp)
            return weather
        }catch{
            delegate?.didFaileWithError(error: error)
            return nil
        }
    }
}
