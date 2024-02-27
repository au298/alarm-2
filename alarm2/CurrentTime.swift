//
//  SceneDelegate.swift
//  alarm2
//
//  Created by 古田聖直 on 2023/12/07.
//

import Foundation

class CurrentTime{
    
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: SleepingViewController?
    
    init() {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateCurrentTime(){
        df.dateFormat = "HH:mm:ss"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
}
