//
//  ContactsController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 15/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import SwiftyContacts

protocol ContactsControllerDelegate: class {
    func userDidAllowAccess(_ controller: ContactsController)
    func userDidDenyAccess(_ controller: ContactsController)
}

class ContactsController {
    weak var delegate: ContactsControllerDelegate?

    /// Request contact access
    func requestAuthorization() {
        requestAccess { [weak self] (response) in
            guard let welf = self else { return }
            if response {
                welf.delegate?.userDidAllowAccess(welf)
            } else {
                welf.delegate?.userDidDenyAccess(welf)
            }
        }
    }
}
