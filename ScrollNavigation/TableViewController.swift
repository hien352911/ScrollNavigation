//
//  TableViewController.swift
//  ScrollNavigation
//
//  Created by MTQ on 12/22/19.
//  Copyright © 2019 MTQ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Navigation Bar"
    }
}

// MARK: - UITableViewDataSource
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.backgroundColor = .red
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UIScrollViewDelegate
extension TableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaTop = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        let offset = scrollView.contentOffset.y + safeAreaTop + (navigationController?.navigationBar.frame.height ?? 0)
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
