//
//  CalendarController.swift
//  Saucial
//
//  Created by Dunya Kirkali on 15/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import Klendario

protocol CalendarControllerDelegate: class {
    func userDidAllowAccess(_ controller: CalendarController)
    func userDidDenyAccess(_ controller: CalendarController, with error: Error)
}

class CalendarController {
    weak var delegate: CalendarControllerDelegate?
    
    /// Request calendar access
    func requestAuthorization() {
        Klendario.requestAuthorization { [weak self] (granted, status, error) in
            guard let welf = self else { return }
            if let error = error {
                welf.delegate?.userDidDenyAccess(welf, with: error)
            } else {
                welf.delegate?.userDidAllowAccess(welf)
            }
        }
    }
    
    /// Creates the Saucial calendar if it doesn't exist
    func createCalendarIfDoesntExist() {
        if checkCalendar() { return }

        let calendar = Klendario.newCalendar()
        calendar.title = "Saucial"
        calendar.save()
    }
}

// MARK: - Private methods
private extension CalendarController {
    
    /// Check's if the Saucial calendar exists
    func checkCalendar() -> Bool {
        let calendars = Klendario.getCalendars()
        return calendars.contains(where: { $0.title == "Saucial" })
    }
}
