//
//  QuestionViewController.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-17.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//

import UIKit
import AVFoundation


class QuestionViewController: UIViewController {
    
    let resultSegue = "Result"
    
    var continentName : String?
    
    @IBOutlet weak var continentLabel : UILabel!
    
    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var ButtonPaus: UIButton!
    
    
    @IBOutlet weak var Buttom2: UIButton!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    @IBOutlet weak var Buttom3: UIButton!
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    @IBOutlet weak var europeImage: UIImageView!
    
    var questions : [Question]!
    
    var audioPlayer : AVAudioPlayer?
    
    @IBOutlet weak var Buttom1: UIButton!
    
    @IBOutlet weak var tipsLabel: UILabel!
    
    // Greating varibels for saving the result and point
    var currentQuestionIndex = 0
    var nrOfQuestions : Int = 0;
    var nrOfCorrectAnsweres : Int = 0;
    var selectedAnswer : String = "";
    var resultText : String = ""
    var audio = true
    var rightOrwrong = [false]
    
   var answeredQuestions = [Question]()
    
    var lastQuestionAnswer = false
    
    // Do any additional setup after loading the view.
    
    @IBOutlet weak var tipsButton: UIButton!
    
    @IBAction func toggleTips(_ sender: Any) {
        
        if tipsButton.titleLabel?.text == "Show Hint" {
            tipsButton.setTitle("Hide Hint", for: .normal)
            tipsLabel.alpha = 1
        }
        else{
            tipsButton.setTitle("Show Hint", for: .normal)
            tipsLabel.alpha = 0
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("continentName: \(String(describing: continentName))")
        continentLabel.text = continentName
        
        // Checking which Qusetion you are in
        currentQuestionLabel.text = " Question " + String(currentQuestionIndex + 1) + " Of " + String(questions.count)
        
        ScoreLabel.text = "Your Score " +  String(nrOfCorrectAnsweres ) +  selectedAnswer + " Of " + String(questions.count)
        
        
        print("View Did load!!")
        
        
        
        questions.shuffle()
        loadQuestion()
        
        
        nrOfQuestions = questions.count
        nrOfCorrectAnsweres = 0
    }
    
    
    // This Next Function takes you to the next question and changes the images and changes the indexes
    func loadQuestion() {
        
        currentQuestionLabel.text = "Question " + String(currentQuestionIndex + 2) + " Of " + String(questions.count)
        self.tipsButton.setTitle("Show Tips", for: .normal)
        self.tipsLabel.alpha = 0
        
        
        
        
        //Control if previos answer is correct
        let tempQues : Question = questions[currentQuestionIndex]
        Buttom1.alpha = 1
        Buttom2.alpha = 1
        Buttom3.alpha = 1
        
        if tempQues.answer == selectedAnswer {
            nrOfCorrectAnsweres += 1
            print("\(nrOfCorrectAnsweres) correct answer out of \(nrOfQuestions)")
            self.view.backgroundColor = UIColor.white        }
        
        
        
        
        //If last question, go to result Segue else show next question
        if questions.count - 1 > currentQuestionIndex {
            currentQuestionIndex += 1
            print("currentQuestionIndex is:   \(questions.count - 1)")
            self.view.backgroundColor = UIColor.white
        } else {
            print("Nr of correct answers: \(nrOfCorrectAnsweres)")
            resultText = "Nr of correct answers: \(nrOfCorrectAnsweres) out of \(questions.count)"
            print("Question count: \(questions.count)")
            performSegue(withIdentifier: resultSegue, sender: self)
            self.view.backgroundColor = UIColor.white
            
        }
        
        
        
        
        
        print("New question index: \(currentQuestionIndex)")
        
        
        let question = questions[currentQuestionIndex]
        Buttom1.setTitle(question.Answer1, for: .normal)
        Buttom2.setTitle(question.Answer2, for: .normal)
        Buttom3.setTitle(question.Answer3, for: .normal)
        europeImage.image = UIImage(named: question.imageID)
        if let ques = question.tips {
            tipsLabel.text = ques
        }
        
        
        print("after if check")
        //      This funtion is adding the Score to Your Quizz
        ScoreLabel.text = "Your Score " +  String(nrOfCorrectAnsweres ) + " Of " + String(questions.count)
        
        
        
    }
    
    
    
    
    
    
    //    This Function display an aleart Button telling you if are Correct
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: "Awsome!", message: "Correct Answer:)", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nextQuestion(alert:)))
        self.present(alert, animated: true, completion: nil)
        self.view.backgroundColor = UIColor.white
        
        self.Buttom1.alpha = 1
        self.Buttom2.alpha = 1
        self.Buttom3.alpha = 1
        self.view.backgroundColor = UIColor.green
        
    }
    
    
    func nextQuestion(alert: UIAlertAction) {
        let question = questions[currentQuestionIndex]
        question.rightOrWrong = lastQuestionAnswer
        answeredQuestions.append(question)
        loadQuestion()
    }
    
    
    
    
    //    This Function display an aleart Button telling you if are Wrong
    func showAlertAction2(title: String, message: String){
        let alert = UIAlertController(title: "Sorry!", message: "Wrong Answer:(", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
            self.view.backgroundColor = UIColor.white
            
            
            self.Buttom1.alpha = 1
            self.Buttom2.alpha = 1
            self.Buttom3.alpha = 1
            self.view.backgroundColor = UIColor.white
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Press here for keep on Playing", style: UIAlertAction.Style.default, handler: nextQuestion(alert:)))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    //    The PausButton
    @IBAction func PausButton(_ sender: UIButton) {
        
        
        if audio == false{
            audioPlayer?.play()
            audio = true
        }
            
        else if audio == true {
            self.audioPlayer?.pause()
            audio = false
        }
        
    }
    
    
    
    
    
    
    //  This funtion Takes you to the next Question and checks
    
    @IBAction func NextQuestion(_ sender: Any) {
        
        
        loadQuestion()
        //        audioPlayer?.stop()
        
        
    }
    
    
    //Control if previos answer is correct
    func CheckAnswer(){
        let tempQues : Question = questions[currentQuestionIndex]
        if tempQues.answer == selectedAnswer{
            
            // When you are Correct you will get a green Screen
            print("inne i check")
            self.view.backgroundColor = UIColor.green
            
            lastQuestionAnswer = true
            showAlertAction(title: "Awsome!", message: "Correct Answer:)")
            
            
        } // When you are not Correct you will get a Red Screen
        else {
            lastQuestionAnswer = false
            self.view.backgroundColor = UIColor.red
            showAlertAction2(title: "Sorry!", message:"Wrong answer:(")
            
        }
        
        
        
        //       when Alert buttons shows the alanativ buttons faddes awaye
        Buttom1.alpha = 0
        Buttom2.alpha = 0
        Buttom3.alpha = 0
        
        
        
    }
    
    // This Button checks if Buttom1Action fits the correct answer EuropaQuzi section.
    
    @IBAction func Buttom1Action(_ sender: UIButton){
        
        if let text = sender.titleLabel?.text {
            selectedAnswer = text
            print("Selected answer \(text)")
            
            print("inne")
            CheckAnswer()
            
        }
        
        
        
        
        
        
    }
    // This Button checks if Buttom2Action fits the correct answer EuropaQuzi part ..
    
    @IBAction func Button2Action(_ sender: UIButton) {
        
        if let text = sender.titleLabel?.text {
            selectedAnswer = text
            print("Selected answer \(text)")
            CheckAnswer()
            
        }
        
        
        
    }
    
    
    // This Button checks if Buttom3Action fits the correct answer EuropaQuzi section.
    @IBAction func Buttom3Action(_ sender: UIButton) {
        
        print("Question index: \(currentQuestionIndex)")
        if let text = sender.titleLabel?.text {
            selectedAnswer = text
            print("Selected answer \(text)")
            CheckAnswer()
            
        }
        
    }
    
    
    
    // This is the Next Question button and Will Randoma Answers, Pictures, The Question
    
    // This feature shows the result on a StoryBoard and overrides the result function.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSegue {
            
            let destinationVC = segue.destination as!    ResultViewController
            destinationVC.resultText = resultText
            destinationVC.questions = questions
            destinationVC.answeredQuestions = answeredQuestions
            self.lastQuestionAnswer = true
          
            
            
            audioPlayer?.stop()
            
        }
        
    }
    
    
    
}

