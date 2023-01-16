//
//  AnimalFunFactsData.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 3/31/21.
//

import Foundation

class AnimalFunFactsData {
    let funfacts = ["Animals with smaller bodies and faster metabolism such as chipmunks and squirrels see in slow motion.", "Reindeer's eyeballs turn blue during winter to help them see at lower light levels. ", "One gram of the king cobra's deadly venom is enough to kill a human 150 times.  ", " Sloths are three times stronger than humans, and can fall 100 feet without getting hurt. ", " An octopus has blue blood, three hearts, and nine brains. ", " You can hypnotize a frog by laying it on it's back and stroking it's stomach. ",  " A single cow makes about 200,000 glasses of milk in their life. ", " Frogs can't vomit; if they really have to, they will vomit out their entire stomach. ",  " Koala's fingerprints are so close to human's that they have messed up crime scenes. ", " The world's fastest punch belongs to Tyson, a mantis shrimp who cracked his quarter inch glass cage. ",  " A grizzly bear's bits is strong enough to crush a bowling ball. ",  " Zebra stripes act as a natural big repellant, especially to harmful horseflies. ", " Giraffes have twenty inch black tongues which prevent sunburn while eating. ", " Otter's have the world's thickest fur, with about one million hair per square inch. ", " Giant anteater's tongues are two feet long, the longest tongue of any mammal. ", " Horses can make 17 facial expressions, which is 3 more than chimps and 10 less than humans. ", " Butterflies taste though their feet, and are 200 times stronger than human taste buds. ",  " Horned lizards squirt blood from their eyes to defend against predators. ", " Spider silk is thinner than human hair, but also five times stronger than steel. ", " The extinct colossus penguin stood as tall as Lebron James. ",  " Some penguins are obsessed with finding pebbles, and even use them to propose. "]

    func randomFact () -> String {
    
        let random = arc4random_uniform(UInt32(funfacts.count))
        return funfacts[Int(random)]
    }
}
