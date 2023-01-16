//
//  HealthTip.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 5/5/21.
//

import UIKit

class HealthTip: UIViewController {

    
    @IBAction func backbutton(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    @IBOutlet weak var healthlabel: UILabel!
    
    
    @IBOutlet weak var newtip: UIButton!
    
    @IBAction func newtipbutton(_ sender: Any) {
        let healthtipdata = HealthTipsData()
        let randomtip = healthtipdata.randomTip()
        healthlabel.text = randomtip
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let healthtipdata = HealthTipsData()
        let randomtip = healthtipdata.randomTip()
        healthlabel.text = randomtip
    }
    


}
