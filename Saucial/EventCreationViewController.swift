//
//  EventCreationViewController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 15/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit
import Eureka
import Klendario
import SwiftyContacts

class EventCreationViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        form
        +++ Section("Event")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "Enter text here"
            }
        +++ SelectableSection<ListCheckRow<String>>("Contacts", selectionType: .multipleSelection)
        +++ Section("Date")
            <<< DateRow() {
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
        +++ Section("Done")
            <<< ButtonRow() {
                $0.title = "Save"
            }.onCellSelection { [weak self] (cell, row) in
                guard let welf = self else { return }
                let valuesDictionary = welf.form.values()
                
                welf.createEvent()
                welf.dismiss(animated: true, completion: nil)
            }

        let continents = ["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America", "South America"]
        for option in continents {
            form.first! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
    }
    
    func createEvent() {
        let calendars = Klendario.getCalendars()
        let saucialCalendar = calendars.first(where: {
            $0.title == "Saucial"
        })!
        
        let event = Klendario.newEvent()
        event.title = "LVM"
        event.calendar = saucialCalendar
        event.startDate = Date()
        event.endDate = Date().addingTimeInterval(60*60*2) // 2 hours
        event.save()
    }
}
