//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import Foundation

class NewsViewModel: NSObject {
    public private(set) var newsModel: NewsModel?
    public private(set) var topHeadlines: [Articles]?
    
    /// Call API to fetch top headline
    /// - Parameters:
    ///   - completion: completion description
    public func callTopHeadlineAPI(completion: @escaping () -> Void) {
        let dictParam: [String: Any] = [API.Request.sources: Constant.sources,
                                        API.Request.apiKey: APIKey.news]
        Network.request(target: .topHeadlines(param: dictParam), success: { [weak self] aData in
            if let response = aData {
                self?.newsModel = try? JSONDecoder().decode(NewsModel.self, from: response)
                self?.topHeadlines = self?.newsModel?.articles
            }
            completion()
            }, failure: { _ in })
    }
}
