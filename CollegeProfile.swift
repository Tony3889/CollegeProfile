//
//  CollegeProfile.swift
//  CollegeProfile
//
//  Created by nburns on 1/21/16.
//  Copyright © 2016 nburns. All rights reserved.
//

import UIKit

class CollegeProfileClass: NSObject {
    
    var collegeName = ""
    var location = ""
    var rating = 0
    var image = UIImage(named: "default")
    
    init(CollegeName: String, Location: String, Rating: Int, Image: UIImage)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        rating = Rating
        image = Image
        
        
    }
    init(CollegeName: String, Location: String)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        
    }


}
