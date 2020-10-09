//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import Foundation
import Moya

enum Service {
    case topHeadlines(param: [String: Any])
}

extension Service: TargetType {
    
    var task: Task {
        switch self {
        case .topHeadlines(let param):
            return .requestParameters(parameters: param, encoding: self.parameterEncoding)
        }
    }
    
    //    /top-headlines?country=us&amp;category=technology&amp;apiKey=a8fabd9ff4234c82aad08eaaa4ea17a0&amp;pageSize=5&amp;page=1
    var baseURL: URL {
        return URL(string: API.URL.live)!
    }
    
    /// The headers to be used in the request.
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    /// MARK: - path
    var path: String {
        switch self {
        case .topHeadlines:
            return "top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .topHeadlines:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .topHeadlines:
            return URLEncoding.queryString
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
