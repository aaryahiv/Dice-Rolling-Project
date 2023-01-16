//
//  AnimalFunFacts.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 3/31/21.
//

import UIKit

class AnimalFunFacts: UIViewController {

    
    @IBAction func backButton(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    
    @IBOutlet weak var funfactslabel: UILabel!
    
    @IBOutlet weak var funfactsbutton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        let funfactsData = AnimalFunFactsData()
        let randomFact = funfactsData.randomFact()
        funfactslabel.text = randomFact

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funfactsbutton.layer.cornerRadius = 3.0
        funfactsbutton.layer.borderWidth = 2.0
        funfactsbutton.layer.borderColor = UIColor.white.cgColor

        let funfactsData  = AnimalFunFactsData()
        let randomFact = funfactsData.randomFact()
        funfactslabel.text = randomFact

    
        
    }
    


}
