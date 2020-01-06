//
//  ViewController.swift
//  UserNotificationSample
//
//  Created by sjbyun on 06/01/2020.
//  Copyright © 2020 sjbyun. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    // MARK:- Constants
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, error) in
            self.notificationCenter.delegate = self
        }
    }
    
    
    
    // MARK:- Actions
    @IBAction func pushNotiBtnTouched(_ sender: Any) {
        let content = UNMutableNotificationContent()
        
        content.title = "Test Title"
        content.subtitle = "Test Subtitle"
        content.body = "Test Body"
        content.badge = 1
        content.sound = .default
        
        /* TimeInterval Notification Trigger */
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        /* Calender Notification Trigger */
//        let nextTriggerDate = Calendar.current.date(byAdding: .second, value: 10, to: Date())!
//        let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: nextTriggerDate)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}



extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

