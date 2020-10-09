//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20


import UIKit

class NewsDetailsVC: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPublishAt: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    // MARK: - Public Properties
    public var articlesDetailsModel: Articles?
    
    // MARK: - View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func configureOnViewDidLoad() {
        guard let model = articlesDetailsModel else { return }
        newsImage.setImageUsingKF(string: model.urlToImage)
        lblTitle.text = (model.title ?? "") == "" ? "N/A" : model.title
        lblAuther.text = (model.author ?? "") == "" ? "N/A" : model.author
        lblDescription.text = model.description
        if let date = model.publishedAt {
            lblPublishAt.text = Utility.changeCustomDateFormate(date, fromFormate: AppDateFormatters.backendFormatter, toFormate: AppDateFormatters.newsDate)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let aObjVC = segue.destination as? LoadWebVC {
            aObjVC.webLink = articlesDetailsModel?.url
        }
    }
    
    // MARK: - Button Action Methods
    
    /// Button Action method for Submit
    /// - Parameter sender: Object of the Button
    @IBAction func btnLoadWebViewTapped(_: UIButton) {
        performSegue(withIdentifier: Segue.moveToViewNews, sender: nil)
    }
}
