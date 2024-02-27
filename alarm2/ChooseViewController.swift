//
//  ChooseViewController.swift
//  alarm2
//
//  Created by 古田聖直 on 2024/02/20.
//

import UIKit

class ChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sleep(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SetViewController") as! SetViewController
        present(secondVC, animated:true, completion:nil)
        
    }
        
//    @IBAction func study(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondVC = storyboard.instantiateViewController(identifier: "NavigationController") as! NavigationController
//        present(secondVC, animated:true, completion:nil)
//        
//    }
            
    

   

}
