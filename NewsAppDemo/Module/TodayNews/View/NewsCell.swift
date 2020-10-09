//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import UIKit

class NewsCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    // MARK: - Private Property
    private var tapGestureRecognizer = UITapGestureRecognizer()
    
    // MARK: - Public Property
    public var didTapOnImage:(UIImage?) -> Void = {_ in}
    public var didTapOnWebView: () -> Void = {}
    
    // MARK: - Public Properties
    public static let identifier = "NewsCell"
    
    // MARK: - Public Methods
    
    /// Configure your data on cell
    /// - Parameter data: data description
    public func configure(data: Articles) {
        newsImage.isUserInteractionEnabled = true
        lblTitle.text = (data.title ?? "") == "" ? "N/A" : data.title
        lblAuther.text = (data.author ?? "") == "" ? "N/A" : data.author
        if let date = data.publishedAt {
            lblDateTime.text = Utility.changeCustomDateFormate(date, fromFormate: AppDateFormatters.backendFormatter, toFormate: AppDateFormatters.newsDate)
        } else {
            lblDateTime.text = "N/A"
        }
        newsImage.setImageUsingKF(string: data.urlToImage)
        tapGestureRecognizer.addTarget(self, action: #selector(imageTapped(gestureRecgonizer:)))
        self.newsImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func imageTapped(gestureRecgonizer: UITapGestureRecognizer) {
        didTapOnImage(self.newsImage.image)
    }
    
    @IBAction func didTapOnFullNews(_ sender: UIButton) {
        didTapOnWebView()
    }
}
