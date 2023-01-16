//
//  MathQuiz.swift
//  DiceRollingProject
//
//  Created by Aaryahi Vaidya on 2/24/21.
//

import UIKit

class MathQuiz: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var gameModels = [Question]()
    var currentQuestion: Question?
    
    @IBAction func back(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setUpQuestions()
        configureUI(question: gameModels.first!)
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
            if let index = gameModels.firstIndex(where: {$0.text == question.text}) {
                if index < (gameModels.count-1){
                    //next question
                    let nextQuestion = gameModels[index+1]
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
        gameModels.append(Question(text: "What is 11 x 12?", answers: [Answer(text: "145", correct: false), Answer(text: "132", correct: true), Answer(text: "154", correct: false), Answer(text: "126", correct: false)]))
        gameModels.append(Question(text: "What is 12 x 8?", answers: [Answer(text: "85", correct: false), Answer(text: "74", correct: false), Answer(text: "96", correct: true), Answer(text: "112", correct: false)]))
        gameModels.append(Question(text: "What is 13 x 7?", answers: [Answer(text: "111", correct: false), Answer(text: "81", correct: false), Answer(text: "71", correct: false), Answer(text: "91", correct: true)]))
        gameModels.append(Question(text: "What is 14 x 14?", answers: [Answer(text: "196", correct: true), Answer(text: "169", correct: false), Answer(text: "154", correct: false), Answer(text: "136", correct: false)]))
    }

}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
