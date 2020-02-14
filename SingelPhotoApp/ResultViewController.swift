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
    
    let cellId = "cellId"
    
    
    
    var answeredQuestions = [Question]()
    
//    let names = ["Hakim", "Jacob", "per"]
    
    let nrOfCorrectAnsweres = [Question]()
    
    @IBOutlet weak var resultTableView: UITableView!
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        labelResult.text = resultText
        self.view.backgroundColor = UIColor.green
       
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
     
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath )
            as! ResultTableViewCell
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.answer
//        cell.textLabel?.text = self.resultText?[indexPath.row]
        
        
     
//
//        var ques : Question
//        ques = questions[indexPath.row]
//
//        cell.labelCorrect.text = "test"
        
        
        return cell
    }
}








