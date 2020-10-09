//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import Foundation

/// This is the Structure for API
internal struct API {
    // MARK: - API URL
    
    /// Structure for URL. This will have the API end point for the server.
    // swiftlint:disable superfluous_disable_command type_name
    struct URL {
        static let live = "https://newsapi.org/v2/"
    }
    
    // MARK: - Basic Response keys
    
    /// Structure for API Response Keys. This will use to get the data or anything based on the key from the repsonse. Do not directly use the key rather define here and use it.
    struct Response {
        
    }
    
    // MARK: - Request end points
    /// Structure for API Request/Method. Define any of your API endpoint/method here.
    struct Request {
        // User
        static let country = "country"
        static let category = "category"
        static let apiKey = "apiKey"
        static let sources = "sources"
        static let pageSize = "pageSize"
        static let page = "page"
    }
}
