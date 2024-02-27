//
//  SceneDelegate.swift
//  alarm2
//
//  Created by 古田聖直 on 2023/12/07.
//

import UIKit
import AVFoundation

class SetViewController: UIViewController {
    
    let alarm = Alarm()
    
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if alarm.timerfinish == true{
            alarm.stopTimer()
            print("ストップタイマーは呼び出されている")
        }
    }
    
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        Alarm.shared.selectedWakeUpTime = sleepTimePicker.date
        Alarm.shared.runTimer()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SleepingViewController") as! SleepingViewController
        present(secondVC, animated:true, completion:nil)
    }
    
//    @IBAction func ShowSecondScreen(_sender: UIButton){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondVC = storyboard.instantiateViewController(identifier: "SleepingViewController") as! SleepingViewController
//        present(secondVC, animated:true, completion:nil)
//    }
}
