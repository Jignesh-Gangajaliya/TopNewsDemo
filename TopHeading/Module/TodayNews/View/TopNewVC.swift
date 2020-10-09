//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20

import UIKit
import Lightbox

class TopNewVC: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private let viewModel = NewsViewModel()
    private var newsLink: String?
    private var selectedIndex: Int?
    
    // MARK: - View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func configureOnViewDidLoad() {
        tableView.tableFooterView = UIView()
        loadTopHeadlines()
    }
    
    /// Load top headlines from API
    private func loadTopHeadlines(isShowLoader: Bool = true) {
        viewModel.callTopHeadlineAPI { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    /// Display Full Image View
    private func displayFullImage(image: UIImage?) {
        guard let image = image else { return }
        let lightboxController = LightboxController(images: [LightboxImage(image: image)], startIndex: 0)
        lightboxController.modalPresentationStyle = .fullScreen
        present(lightboxController, animated: true, completion: nil)
    }
    
    /// Present View for load webview
    private func loadWebView(link: String?) {
        newsLink = link
        performSegue(withIdentifier: Segue.moveToViewNews, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let aObjVC = segue.destination as? LoadWebVC {
            aObjVC.webLink = newsLink
        }
        if let aObjVC = segue.destination as? NewsDetailsVC {
            if let index = selectedIndex {
                aObjVC.articlesDetailsModel = viewModel.topHeadlines?[index]
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TopNewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.topHeadlines?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell
        if let model = viewModel.topHeadlines?[indexPath.row] {
            cell?.configure(data: model)
            cell?.didTapOnWebView = { [weak self] in
                self?.loadWebView(link: model.url)
            }
            cell?.didTapOnImage = { [weak self] image in
                self?.displayFullImage(image: image)
            }
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: Segue.moveToNewsDetails, sender: nil)
    }
}
