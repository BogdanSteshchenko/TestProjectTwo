//
//  Notifications.swift
//  TestProjectTwo
//
//  Created by Developer on 26.09.2022.
//

import UserNotifications

class Notifications {
    
    static let shared = Notifications()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    // MARK: - Initialization
    private init() {
    }
    
    func permissionToSendNotifications() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .alert]) { granted, _ in
            guard granted else { return }
            self.notificationCenter.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
    }
    func sendNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "New news"
        content.body = "Putin XUYLO"
        content.sound = UNNotificationSound.default
        
        let dateComponents = DateComponents(hour: 12)

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
          repeats: true)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request)
    }
}
