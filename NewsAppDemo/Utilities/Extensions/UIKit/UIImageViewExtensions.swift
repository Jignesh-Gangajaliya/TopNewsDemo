//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import Kingfisher
import UIKit

// MARK: - Methods

public extension UIImageView {
    func setImageUsingKF(string: String?) {
        if string ?? "" != "" {
            kf.setImage(with: URL(string: string ?? ""), placeholder: UIImage(named: "image_placeholder"), options: [
                .transition(.fade(1)),
                .cacheOriginalImage])
        } else {
            self.image = UIImage(named: "image_placeholder")
        }
    }
}
