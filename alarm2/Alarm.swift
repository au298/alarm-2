//
//  SceneDelegate.swift
//  alarm2
//
//  Created by 古田聖直 on 2023/12/07.
//

import AVFoundation
import UIKit

class Alarm{
    
    static let shared = Alarm()
    
    var selectedWakeUpTime: Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    var timerfinish = false
    
    func runTimer(){
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        guard sleepTimer == nil else { return }
        if sleepTimer == nil{
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc private func updateTimer(){
        if seconds != 0{
            seconds -= 1
            print(seconds)
        }else{
            sleepTimer?.invalidate()
            sleepTimer = nil
            timerfinish = true
            guard let soundFilePath = Bundle.main.path(forResource: "alarm", ofType: "mp3") else {
                print("音源が見つかりません")
                return
            }
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            } catch {
                print("Cannot load file")
            }
            audioPlayer.play()
            timerfinish = true
            print(audioPlayer.isPlaying)
        }
    }
    
    private func calculateInterval(userAwakeTime:Date)-> Int{
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0{
            interval = 86400 - (0 - interval)
        }
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
    
    func stopTimer(){
        if sleepTimer != nil {
            sleepTimer!.invalidate()
            sleepTimer = nil
        }
        if let player = audioPlayer {
            player.stop()
            audioPlayer = nil // アラーム音を停止したら audioPlayer を nil に設定する
        }
    }
}

