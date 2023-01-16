//
//  ViewController.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 1/13/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var diceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollDice(_ sender: Any) {
        
        let number = (1...6).randomElement()!
        self.diceImageView.image = UIImage(named: "dice-\(number)")
            
        if(number == 2){
            guard let vc = storyboard?.instantiateViewController(identifier: "truthordare") as? TruthorDare else {
                return
            }
            present(vc, animated: true)
            
        } else if(number == 3){
            guard let vc1 = storyboard?.instantiateViewController(identifier: "mathquiz") as? MathQuiz else {
                return
            }
            present(vc1, animated: true)
            
        } else if(number == 4){
            guard let vc2 = storyboard?.instantiateViewController(identifier: "animalfunfacts") as? AnimalFunFacts else {
                return
            }
            present(vc2, animated: true)
            
        }  else if(number == 5){
            guard let vc3 = storyboard?.instantiateViewController(identifier: "healthtip") as? HealthTip else {
                return
            }
            present(vc3, animated: true)
            
        } else if(number == 6){
            guard let vc4 = storyboard?.instantiateViewController(identifier: "geoquiz") as? GeoQuiz else {
                return
            }
            present(vc4, animated: true)
            
        }
        
    }
    
    

}

