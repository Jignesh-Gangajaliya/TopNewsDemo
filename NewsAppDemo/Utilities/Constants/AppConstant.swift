//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import UIKit

let APPDELEGATE: AppDelegate = UIApplication.shared.delegate as! AppDelegate

/// General object of UIApplication
let APPLICATION = UIApplication.shared

/// General object of Main Bundle
let MAINBUNDLE = Bundle.main

struct AppLimits {
    static let pageSize = 5
}

struct APIKey {
    static let news = "7ef6c6ad69394f70947a9f4a83b37864"
}

struct AppDateFormatters {
    static let backendFormatter = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let newsDate = "MMM, yyyy h:mm a"
}

struct Constant {
    static let sources = "google-news"
}

struct Segue {
    static let moveToViewNews = "moveToViewNews"
    static let moveToNewsDetails = "moveToNewsDetails"
}

struct Localizable {
    static let title = "Title"
    static let author = "Author"
    static let description = "PublishedAt"
}
