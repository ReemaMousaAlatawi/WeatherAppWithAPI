//
//  ViewController.swift
//  weather
//
//  Created by Reema Mousa on 30/07/1443 AH.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
    @IBOutlet weak var conditionalImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempretureLable: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
     }
 
    @IBAction func serchButtonPressed(_ sender: Any) {
        if let city = searchTF.text {
            weatherManager.fitchWeather(cityName: city)
        }
    }
}


extension WeatherViewController : WeatherManagerDelegate{

    func didUpdateWeather(weatherMAneger: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempretureLable.text = weather.temperatureString
            self.conditionalImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName


        }
    }

    func didFaileWithError(error: Error) {
        print(error)
    }
    
}
