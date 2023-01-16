//
//  TruthorDare.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 2/3/21.
//

import UIKit

class TruthorDare: UIViewController {

    var counterTruth = 0
    var counterDare = 0
    
    @IBAction func back(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    
    @IBOutlet weak var truthdare: UIImageView!
    
    @IBAction func truth(_ sender: Any) {
        
        if counterTruth == 6 {
            counterTruth = 0
        }
        
        truthdare.image = UIImage(named: "kidstruth\(counterTruth)")
        counterTruth += 1
        
    }
    
    
    
    @IBAction func dare(_ sender: Any) {
        if counterDare == 6 {
            counterDare = 0
        }
        
        truthdare.image = UIImage(named: "kidsdare\(counterDare)")
        counterDare += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
