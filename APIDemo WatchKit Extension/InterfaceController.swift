//
//  InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    
    @IBOutlet var cityLabel: WKInterfaceLabel!
    
    
    @IBOutlet var imageIcon: WKInterfaceImage!
    
    @IBOutlet var tempLabel: WKInterfaceLabel!
    
    let locationManager = CLLocationManager()
    var weatherName : String = ""

    
    @IBAction func changeCityButton() {
        
       
    }
 
    
    
    
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
       
        
    }
    
    
    
    
    
    override func willActivate() {
        
        let preferences = UserDefaults.standard
    
        var lat = preferences.string(forKey:"newLat")
        var lng = preferences.string(forKey:"newLng")
        var city = preferences.string(forKey:"newCity")
        let url = "https://samples.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&appid=b6907d289e10d714a6e88b30761fae22"

       
        
        super.willActivate()
        Alamofire.request(url).responseJSON {
            
            response in
          
            let apiData = response.result.value
            if (apiData == nil) {
                print("Error when getting API data")
                return
            }
            // -- if no errors, then keep going
            
            print(apiData)
            
           
            // 2a. Convert the response to a JSON object
            let json = JSON(apiData)
            func updateWeatherData(json : JSON) {
                let name = json["list"]["name"].string
                let temp = json["list"]["main"]["temp"].string
               // let temp1 = String(temp)
                print(temp)
                print(name)
                
                
                self.cityLabel.setText(name)
                self.tempLabel.setText(temp)
        
        
        
    }
            
        }
        
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
}
    
