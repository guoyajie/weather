//
//  ViewController.swift
//  weather
//
//  Created by mohoo on 14/8/12.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var image2: UIImageView!
  
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var city: UILabel!
    
    
    @IBOutlet weak var pm25: UILabel!
   
    @IBOutlet weak var currentDate: UILabel!
    
    
    @IBOutlet weak var date2: UILabel!
            
    @IBOutlet weak var date3: UILabel!
   
    @IBOutlet weak var date4: UILabel!
    
    @IBOutlet weak var date5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var lng = "116.305145"
        var lat = "39.982368"
        var position = lng + "," + lat
        let url=NSURL(string:"http://api.map.baidu.com/telematics/v3/weather?location=\(position)&output=json&ak=DCb2d6df5f7f732e4daeeadde7b2470c")
        
        var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
        
        
        var jsons = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
        
        disPlay(jsons)
        
        
        
    }

    
    
    
    func disPlay(json:NSDictionary){
        
        currentDate.text = json.objectForKey("date") as String
        
        
        var positionInfo = json.objectForKey("results") as NSArray
        //println(json)
        
        var result = positionInfo[0] as NSDictionary
        
        
        city.text = result.objectForKey("currentCity") as String
        pm25.text = result.objectForKey("pm25") as String
        
        
        
        var weather_data = result.objectForKey("weather_data") as NSArray
        var date1 = ["","","",""]
        var dayPicture = ["","","",""]
        var n = weather_data.count
        for i in 0 ..< n {
            
            var dates = weather_data[i] as NSDictionary
            var date = dates.objectForKey("date") as String
            var weather = dates.objectForKey("weather") as String
            var wind = dates.objectForKey("wind") as String
            var temperature = dates.objectForKey("temperature") as String
            dayPicture[i] = dates.objectForKey("dayPictureUrl") as String
            date1[i] = date+"\n"+weather+"\n"+wind+"\n"+temperature
            
        }
        date2.text = date1[0]
        date3.text = date1[1]
        date4.text = date1[2]
        date5.text = date1[3]
        
        image2.image = UIImage(data: NSData(contentsOfURL:NSURL(string: dayPicture[0])))
        image3.image = UIImage(data: NSData(contentsOfURL:NSURL(string: dayPicture[1])))
        image4.image = UIImage(data: NSData(contentsOfURL:NSURL(string: dayPicture[2])))
        image5.image = UIImage(data: NSData(contentsOfURL:NSURL(string: dayPicture[3])))
        


        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

