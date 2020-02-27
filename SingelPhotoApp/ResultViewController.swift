//
//  ResultViewController.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-23.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//
import Foundation
import UIKit

class ResultViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    
    var resultText : String?
   
    var questions : [Question] = []
    
    let cellId = "cellId2"
    
    
    var answeredQuestions = [Question]()
    

    let nrOfCorrectAnsweres = [Question]()
    
    @IBOutlet weak var resultTableView: UITableView!
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("answeredQuesCount \(answeredQuestions.count)")

        labelResult.text = resultText
        resultTabel()

       
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answeredQuestions.count
        
        
     
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath )
            as! ResultTableViewCell
        
        //let question = questions[indexPath.row]
        let result = answeredQuestions[indexPath.row]
        let isCorrect : Bool = result.rightOrWrong
        
        
        cell.cellImage.image = UIImage(named:  result.imageID)
    

        
        if !isCorrect{
            cell.backgroundColor = UIColor.red
            cell.cellLabel?.text = "Wrong answer"
        }
        
        else {
            cell.backgroundColor = UIColor.green
            cell.cellLabel?.text = "Correct answer"
            }
            

        
        
        return cell
        
    }
    
    func resultTabel(){
        resultTableView.layer.cornerRadius = 8
        resultTableView.layer.borderWidth = 2
        labelResult.layer.cornerRadius = 5
        labelResult.layer.borderWidth = 2
    
        
        
        
    }
}








