//
//  ViewController.swift
//  Quizzler-iOS13
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
  var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        // Do any additional setup after loading the view.
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userOutput =  quizBrain.checkAnswer(userAnswer)
        
        if userOutput{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateQuestion(){
        questionLabel.text =  quizBrain.getQuestionText()
        let answerChoices = quizBrain.getOptionText()
        option1.setTitle(answerChoices[0], for: .normal)
        option2.setTitle(answerChoices[1], for: .normal)
        option3.setTitle(answerChoices[2], for: .normal)
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        let percentageProgress = quizBrain.getProgress()
        progressBar.progress = percentageProgress
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
}

