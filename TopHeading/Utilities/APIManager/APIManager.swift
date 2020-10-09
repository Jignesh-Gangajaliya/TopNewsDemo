//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import UIKit
import Alamofire
import Moya
import SVProgressHUD

struct AlamofireManager {
    
    static let shared: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60.0           // Seconds
        configuration.timeoutIntervalForResource = 60.0          // Seconds
        return Alamofire.Session(configuration: configuration)
    }()
}

private let provider = MoyaProvider<Service>(session: AlamofireManager.shared)

class Network {
    
    /// - Parameters:
    ///   - target: Your API Target.
    ///   - successCallback: Success block.
    ///   - failureCallback: failure block.
    
    class func request(target: Service, isShowLoader: Bool = true, success successCallback: @escaping (_ response: Data?) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        
        print("==== URL ===== \(target.baseURL)")
        print("==== PATH ==== \(target.path)")
        print("==== METHOD ==== \(target.method.rawValue)")
        print("==== HEADER ==== \(target.headers ?? [:])")
        print("==== PARAMETER ==== \(target.task)")
        
        if isShowLoader {
            SVProgressHUD.show(withStatus: "Loading...")
        }
        
        provider.request(target) { (result) in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let response):
                print(response.statusCode)
                switch response.statusCode {
                case 200...300:
                    successCallback(response.data)
                default:
                    break
                }
            case .failure(let error):
                print("")
                failureCallback(error)
            }
        }
    }
}
