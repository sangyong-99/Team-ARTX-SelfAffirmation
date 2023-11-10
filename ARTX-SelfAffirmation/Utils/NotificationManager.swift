//
//  Notification.swift
//  ARTX-SelfAffirmation
//
//  Created by yusang on 11/6/23.
//

import UserNotifications
import Foundation
import SwiftUI

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    static let shared = NotificationManager()
    
    //알림 권한 처음에 요청받게 나오는 함수
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification 권한 성공")
            } else {
                print("Notification 권한 거부당함")
            }
        }
    }
    
    //알림 함수 - 안쓰고 밑에거 쓸거임
    func scheduleNotification() {
        
        //content - 알림에 필요한 메세지의 기본속성을 설정하는 역할
        let content = UNMutableNotificationContent()
        content.title = "ARTX" // 알림 제목 설정
        content.body = "안쓸거임" // 알림 내용 설정
        content.sound = UNNotificationSound.default
        
        // trigger - time 발동 조건 관리 timeInterval은 초단위
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        //request - 알림 요청 생성
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        //알림 등록
        UNUserNotificationCenter.current().add(request)
    }
    
    //시간 받아서 알림쓰는 함수 - 이거 사용할거임, identifier는 시간별로 여러번 보낼 경우, 알림 구별할려고 사용
    func scheduleNotification(identifier: String, affirmation: Array<CardData>, hour: Int, minute: Int) {
        let randomNotificationContent = getRandomNotificationContent(affirmation: affirmation)
        
        let content = UNMutableNotificationContent()
        content.title = "ARTX" // 알림 제목 설정
        content.body = randomNotificationContent // 알림 내용 설정
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        //let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request)
    }
    
    //알림 설정 정보 가져오는 코드 - 안씀, 필요없음
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print("Notification settings: \(settings)")
        }
    }
    
    //알림 취소 - 쓸려다가 밑에 있는 remove쓰기로함
    func cancelNotification(identifier: String) {
           notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
       }
    
    //알림 전부 삭제 - on/off에선 이게 더 편해서 사용, uikit프로젝트처럼 notification으로 정보 보내는게 없어서 사용하기 편함
    func removeNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func getRandomNotificationContent(affirmation: Array<CardData>) -> String {
        return NSLocalizedString(affirmation.randomElement()!.title, comment: "Localized String")
    }
}

