//
//  SecondInterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Jasvir Kaur on 2019-11-05.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var Label: WKInterfaceLabel!
    var city: String!
    var temp: String!

    @IBAction func selectCounrty() {
        
        let suggestedResponses = ["Moscow", "Kiev", "England"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .allowAnimatedEmoji) { (results) in
            
            
            if (results != nil && results!.count > 0) {
                // 2. write your code to process the person's response
                let userResponse = results?.first as? String
                self.Label.setText(userResponse)
                self.city = userResponse
            }
        }
    }
    
    @IBAction func getWeather() {
     
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
