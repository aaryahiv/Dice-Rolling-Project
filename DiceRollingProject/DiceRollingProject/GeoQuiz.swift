//
//  GeoQuiz.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 5/26/21.
//

import UIKit

class GeoQuiz: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var geoModels = [Question]()
    var currentQuestion: Question?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    
    @IBAction func backbutton(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion
        
        else{
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            if let index = geoModels.firstIndex(where: {$0.text == question.text}) {
                if index < (geoModels.count-1){
                    //next question
                    let nextQuestion = geoModels[index+1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                } else {
                    //end of game
                    let alert = UIAlertController(title: "Done", message: "You beat the game", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
            }
        } else {
            //wrong
            let alert = UIAlertController(title: "Wrong", message: "Try harder", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        
    }
    
    private func setUpQuestions() {
        geoModels.append(Question(text: "How many continents are there?", answers: [Answer(text: "9", correct: false), Answer(text: "11", correct: false), Answer(text: "7", correct: true), Answer(text: "8", correct: false)]))
        geoModels.append(Question(text: "Which desert covers much of northern Africa?", answers: [Answer(text: "The Gobi", correct: false), Answer(text: "The Sahara", correct: true), Answer(text: "The Namib", correct: false), Answer(text: "The Sonoran", correct: false)]))
        geoModels.append(Question(text: "How many states are there in the United States??", answers: [Answer(text: "50", correct: true), Answer(text: "55", correct: false), Answer(text: "71", correct: false), Answer(text: "60", correct: false)]))
        geoModels.append(Question(text: "In what country would you find the Great Pyramids of Giza?", answers: [Answer(text: "Saudi Arabia", correct: false), Answer(text: "Yemen", correct: false), Answer(text: "Syria", correct: false), Answer(text: "Egypt", correct: true)]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setUpQuestions()
        configureUI(question: geoModels.first!)
        
    }
 
    
    struct Question {
        let text: String
        let answers: [Answer]
    }

    struct Answer {
        let text: String
        let correct: Bool
    }
   

}
