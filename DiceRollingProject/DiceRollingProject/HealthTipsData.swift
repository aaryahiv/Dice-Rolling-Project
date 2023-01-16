//
//  HealthTipsData.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 5/5/21.
//

import Foundation

class HealthTipsData {
    
    let healthtips = ["Spinach guarantees clear skin.", "Laughing can help your heart and lungs, promotes muscle relaxation, and can reduce anxiety.", "Go for a walk! Nature calms our nerves and relieves mental fatigue.", "Meditation offers tranquility,  helps with anxiety and depression, cancer, chronic pain, asthma, heart disease and high blood pressure.", "Try deep breathing as a form of meditation!", "Set goals for yourself and focus on your strengths.", "Sit up straight and practice improving your posture.", "Start taking compliments!", "Do something you enjoy and spend some time alone.", "If you are in a cleaner environment, you will be more motivated to do things.", "Take breaks from social media and make time for your health.", "Try journaling your thoughts."]
    
    
    func randomTip () -> String {
    
        let random = arc4random_uniform(UInt32(healthtips.count))
        return healthtips[Int(random)]
    }
}

