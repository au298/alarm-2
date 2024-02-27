import Foundation
import UIKit

class SleepingViewController: UIViewController {
    
    var remainingButtons = 100
    
    var currentTime = CurrentTime()
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var backbutton: UIButton!
    @IBOutlet var awakebutton: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
//        timer = Timer(timeInterval: 5.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: false)

        
//        timer.fire()
        currentTime.delegate = self
        awakebutton.isHidden = true
    }
    
    @objc func onTimerCalled() {
        print("timerは呼ばれた")
        backbutton.isHidden = true
    }
    
    @IBAction func back(_sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: UIButton) {
        //残りのボタンがある場合はアラームを停止せずに終了
        if remainingButtons > 0 {
            return
        }
        
        Alarm.shared.stopTimer()
        
        let calendar = Calendar.current
        let currentDate = Date()
//        if let futureDate = calendar.date(byAdding: .hour, value: 17, to: currentDate) {
//            Alarm.shared.selectedWakeUpTime = futureDate
//            Alarm.shared.runTimer()
//        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateTime(_ time: String) {
        
        if Alarm.shared.seconds <= 1 {
            timeLabel.text = " "
            if Alarm.shared.seconds == 1{
                resetGame()
            }
        } else {
            timeLabel.text = time
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        print("\(sender.tag) の絵文字が押されたよ！")
        
        sender.removeFromSuperview()
        remainingButtons -= 1
        
        // 残りのボタンがない場合はアラームを停止
        if remainingButtons == 0 {
            Alarm.shared.stopTimer()
            awakebutton.isHidden = false
        }
    }
    
    func resetGame() {
        for i in 0 ..< 100 {
            let button = addButton(on: view)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            button.setTitle("🍎", for: .normal)
            button.tag = i
            button.addAction(
                .init(handler: { action in
                    let sender = action.sender as! UIButton
                    self.buttonTapped(sender)
                }), for: .touchUpInside
            )
            }
    }
    
}
