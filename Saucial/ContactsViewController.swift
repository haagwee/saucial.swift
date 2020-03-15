//
//  ContactsViewController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 10/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit
import Contacts
import SwiftyContacts

class ContactsViewController: UITableViewController {
    private var contacts = [CNContact]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchContacts(completionHandler: { (result) in
            switch result{
                case .success(response: let contacts):
                    self.contacts = contacts
                    break
                case .failure(error: let error):
                    print(error)
                break
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = contacts[indexPath.row].givenName
        return cell
    }
}
