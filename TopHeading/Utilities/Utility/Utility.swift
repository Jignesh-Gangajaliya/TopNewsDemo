//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import Foundation

class Utility: NSObject {
    
    // Convert Date Formate From String To Display in View
    public static func changeCustomDateFormate(_ date: String, fromFormate: String, toFormate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormate
        let tempdate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = toFormate
        if tempdate != nil {
            // Here using numberStyle formatter add suffix for day
            let calendar = Calendar.current
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .ordinal
            let dateComponents = calendar.component(.day, from: tempdate!)
            let day = numberFormatter.string(from: dateComponents as NSNumber)
            return "\(day!) \(dateFormatter.string(from: tempdate!))"
        } else {
            return ""
        }
    }
}
