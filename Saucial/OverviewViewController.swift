//
//  OverviewViewController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 15/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {
    @IBAction func didTapAddButton() {
        let vc = EventCreationViewController()
        
        present(vc, animated: true, completion: nil)
    }
}
