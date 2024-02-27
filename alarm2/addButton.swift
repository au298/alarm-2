import UIKit

func addButton(on view: UIView) -> UIButton {
    let buttonSize = 32
    let rangeX = 25...Int(view.frame.width - 50)
    let rangeY = 45...Int(view.frame.height - 120)
    let buttonX = Int.random(in: rangeX)
    let buttonY = Int.random(in: rangeY)
    let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonSize, height: buttonSize))
    button.setTitleColor(.label, for: .normal)
    view.addSubview(button)
    return button
}


