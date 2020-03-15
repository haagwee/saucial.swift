//
//  CalendarViewController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 15/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit
import EventKit
import Klendario

class CalendarViewController: UITableViewController {
    private var events = [EKEvent]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: (dunyakirkali) Move to CalendarController
        let calendars = Klendario.getCalendars()
        let saucialCalendar = calendars.first(where: {
            $0.title == "Saucial"
        })!
        
        Klendario.getEvents(from: Date(), to: Date() + 60*60*2, in: [saucialCalendar]) { (events, error) in
            guard let events = events else { return }
            
            self.events = events
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = events[indexPath.row].title
        return cell
    }
}
