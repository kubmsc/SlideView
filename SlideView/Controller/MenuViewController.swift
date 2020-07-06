//
//  MenuViewController.swift
//  SlideView
//
//  Created by Kuba  on 15/06/2020.
//  Copyright © 2020 Kuba . All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
}

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true)
    }
}
