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
    
    var buttonsArray = [UIButton?]()
    
    
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
        self.view.backgroundColor = UIColor.black
        
        
        
        
        designButtons()
        
        print("continentName: \(String(describing: continentName))")
        continentLabel.text = continentName
        
        // Checking which Qusetion you are in
        currentQuestionLabel.text = " Question " + String(currentQuestionIndex + 1 ) + " Of " + String(questions.count)
        
        ScoreLabel.text = "Your Score " +  String(nrOfCorrectAnsweres ) +  selectedAnswer + " Of " + String(questions.count)
        
        
        
        questions.shuffle()

        loadQuestion()
        
        nrOfQuestions = questions.count
        nrOfCorrectAnsweres = 0
        
        audioPlayer?.play()
        
        
    }
    
    
    
    
    // This Next Function takes you to the next question and changes the images and changes the indexes
    func loadQuestion() {
        
        
        currentQuestionLabel.text = "Question " + String(currentQuestionIndex + 1) + " Of " + String(questions.count)
        self.tipsButton.setTitle("Show Hint", for: .normal)
        self.tipsLabel.alpha = 0
        
        
        
        
        //Control if previos answer is correct
     
        Buttom1.alpha = 1
        Buttom2.alpha = 1
        Buttom3.alpha = 1
        
        print("New question index: \(currentQuestionIndex)")
        
        let question = questions[currentQuestionIndex]
        
        
        var answers = [ question.Answer1, question.Answer2, question.Answer3]
        answers.shuffle()
        Buttom1.setTitle(answers[0], for: .normal)
        Buttom2.setTitle(answers[1], for: .normal)
        Buttom3.setTitle(answers[2], for: .normal)
        
        europeImage.image = UIImage(named: question.imageID)
        if let ques = question.tips {
            tipsLabel.text = ques
        }
        
        
        
        //      This funtion is adding the Score to Your Quizz
        ScoreLabel.text = "Your Score " +  String(nrOfCorrectAnsweres ) + " Of " + String(questions.count)
        
        currentQuestionIndex += 1
        self.view.backgroundColor = UIColor.black
     
    }
    
  
    
    //    This Function display an aleart Button telling you if are Correct
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: "Awsome 😍 ! ", message: "Correct Answer:)", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nextQuestion(alert:)))
        self.present(alert, animated: true, completion: nil)
        self.view.backgroundColor = UIColor.white
        
        self.Buttom1.alpha = 1
        self.Buttom2.alpha = 1
        self.Buttom3.alpha = 1
        self.view.backgroundColor = UIColor.green
        
    }
    
//    This funtion takes you to the next Question
    func nextQuestion(alert: UIAlertAction) {
        let question = questions[currentQuestionIndex - 1]
        question.rightOrWrong = lastQuestionAnswer
        answeredQuestions.append(question)
        
        print("!!! index:  \(currentQuestionIndex) count: \(questions.count)")
        self.view.backgroundColor = UIColor.white
      
        if currentQuestionIndex >= questions.count  {
            
            print("Nr of correct answers: \(nrOfCorrectAnsweres)")
            resultText = "Nr of correct answers: \(nrOfCorrectAnsweres) out of \(questions.count)"
            print("Question count: \(questions.count)")
            performSegue(withIdentifier: resultSegue, sender: self)
            self.view.backgroundColor = UIColor.white
            return
        
            
        } else {
            
         loadQuestion()
        }
    }
    
    
    
    
    //    This Function display an aleart Button telling you if are Wrong
    func showAlertAction2(title: String, message: String){
        let alert = UIAlertController(title: "Sorry 🙄 !", message: "Wrong Answer - 1 point:(", preferredStyle: UIAlertController.Style.alert)
        
        
        
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
    
    
    //Control if previos answer is correct
    func CheckAnswer(){
        let tempQues : Question = questions[currentQuestionIndex - 1]
        if tempQues.answer == selectedAnswer{
            
            // When you are Correct you will get a green Screen
             nrOfCorrectAnsweres += 1

            self.view.backgroundColor = UIColor.green
            
            lastQuestionAnswer = true
            showAlertAction(title: "Awsome!", message: "Correct Answer:)")
            
            
        } // When you are not Correct you will get a Red Screen
        else {
            lastQuestionAnswer = false
            self.view.backgroundColor = UIColor.red
             nrOfCorrectAnsweres -= 1
            showAlertAction2(title: "Sorry!", message:"Wrong answer:(")
            
        }
        
        
        
        //  When Alert buttons shows the alanativ buttons faddes awaye
        Buttom1.alpha = 0
        Buttom2.alpha = 0
        Buttom3.alpha = 0
        
        
        
    }
    
    // This Button checks if Buttom1Action fits the correct answer EuropaQuzi section.
    
    @IBAction func Buttom1Action(_ sender: UIButton){
        
        if let text = sender.titleLabel?.text {
            
            selectedAnswer = text

            CheckAnswer()
            
        }
        
        
        
        
        
        
    }
    // This Button checks if Buttom2Action fits the correct answer EuropaQuzi part ..
    
    @IBAction func Button2Action(_ sender: UIButton) {
        
        if let text = sender.titleLabel?.text {
            selectedAnswer = text
            CheckAnswer()
            
        }
        
        
        
    }
    
    
    // This Button checks if Buttom3Action fits the correct answer EuropaQuzi section.
    @IBAction func Buttom3Action(_ sender: UIButton) {
        
        print("Question index: \(currentQuestionIndex)")
        if let text = sender.titleLabel?.text {
            selectedAnswer = text
            CheckAnswer()
            
        }
        
    }
    
    
    
    // This is the Next Question button and Will Randoma Answers, Pictures, The Question
    
    // This feature shows the result on a StoryBoard and overrides the result function.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSegue {
            
            let destinationVC = segue.destination as!ResultViewController
            destinationVC.resultText = resultText
            destinationVC.questions = questions
            destinationVC.answeredQuestions = answeredQuestions
            lastQuestionAnswer = true
            audioPlayer?.stop()
            
            
        }
        
    }
    
    
//    DeSignButtons and images
    func designButtons(){
        ButtonPaus.layer.cornerRadius = 10
        ButtonPaus.layer.borderWidth = 2
        tipsButton.layer.cornerRadius = 10
        tipsButton.layer.borderWidth = 2
        Buttom1.layer.cornerRadius = 10
        Buttom1.layer.borderWidth = 1
        Buttom2.layer.cornerRadius = 10
        Buttom2.layer.borderWidth = 1
        Buttom3.layer.cornerRadius = 10
        Buttom3.layer.borderWidth = 1
        europeImage.layer.cornerRadius = 8
        europeImage.layer.borderWidth = 2
        europeImage.layer.borderColor = UIColor.purple.cgColor
        
        
        
        
    }
    
    
    
}

