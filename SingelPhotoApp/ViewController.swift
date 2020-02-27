//
//  ViewController.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-12.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
 
    var contName : String?

    let segueToQuestions = "segueToQuestions"
    
    var questions = [Question]()
    
   
    
    var audioPlayer = AVAudioPlayer()
    

    

    
    
    @IBOutlet weak var euoropa: UIButton!
    
    @IBOutlet weak var Afrika: UIButton!
    
    @IBOutlet weak var Asia: UIButton!
    
    
    @IBOutlet weak var SouthAmerica: UIButton!
    
    
    
    
    @IBAction func AsiaButtom(_ sender: UIButton) {
        
    contName = "Asia"
        
    loadAsiaQuestions()
        
    changeMusci(fileName:  "03- Gopala")
    
    audioPlayer.play()
        
        performSegue(withIdentifier: segueToQuestions , sender: self)
        
    }
    
    
    
    
    @IBAction func EuropaButtom(_ sender: Any) {
        
        contName = "Europa"
        
        loadEuropeQuestions()
        
        //       changeMusci(fileName: "Toto - Africa (Diezeo Remix)")
                
        //        audioPlayer.play()
        
        performSegue(withIdentifier: segueToQuestions , sender: self)
        
    }
    
    
    

//    The Darkmode Switch
    @IBOutlet weak var OutletSwitch: UISwitch!
    
    @IBOutlet weak var LabelDark: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        design()
    
    }
//    DarkMode Funtion
    @IBAction func darkAction(_ sender: Any) {
        if OutletSwitch.isOn == true{
            view.backgroundColor = UIColor.black
            LabelDark.textColor = UIColor.white
        }
        else{
            view.backgroundColor = UIColor.white
            LabelDark.textColor = UIColor.black
            
        
      }
        }
    
    
    
    
    //This function changes music forech katogogri and continent
    
    func changeMusci(fileName : String, fileType : String = "mp3") {
        
        let sound = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL (fileURLWithPath: sound!))
        }
        catch{
            print(" \(error)")
        }
        
    }
    
    
   
    
    
//    The Africa choic button
    @IBAction func buttonNorthAmerica(_ sender: Any) {
        contName = "Africa"
    
        loadAfricaQuestion()
        
        changeMusci(fileName: "Toto - Africa (Diezeo Remix)")
        
        audioPlayer.play()
        
        performSegue(withIdentifier: segueToQuestions , sender: self)
//     
    }
    
    
    
    @IBAction func SouthAmerica(_ sender: Any) {
        contName = " SouthAmerica"
        
        loadSouthAmericaQuestions()
        
     
       changeMusci(fileName: "Le Gang - Anita Latina")
        
       audioPlayer.play()
        
        
        performSegue(withIdentifier: segueToQuestions , sender: self)
        
        
        
        
        
    }
    
    

    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToQuestions {
            
            let destinationVC = segue.destination as! QuestionViewController
            //            print(contName)
            
            destinationVC.continentName = contName
            
            destinationVC.questions = questions
            
            destinationVC.audioPlayer = audioPlayer
            
            
            
            
        }
 
    }
    
     //Questions for Europa
    
    func loadEuropeQuestions() {
        
        let q1 = Question(tips: "This City is known for its beutifuls stone Island?", answer: "Oslo", Answer1: "Reykjavik", Answer2: "Oslo", Answer3: "Stockhom",imageId: "norway")
    
        
        let q2 = Question(tips: "In 1710, an invasion by Peter the Great of Russia ended Swedish rule and cemented Russian influence on the city." , answer: "Riga", Answer1: "Copenhagen ",Answer2: "Prag",Answer3: "Riga", imageId: "riga")
        
        let q3 = Question(tips: "This City is known for its wonderful mountain range and ski resorts?" , answer: "Austria", Answer1: "Austria",Answer2: "Berlin",Answer3: "Paris",imageId: "Austria")
        
        let q4 = Question(tips: "This City is known for its Wall which fell in the early 90's?" , answer: "Berlin", Answer1: "Prague",Answer2: "Riga",Answer3: "Berlin",imageId: "berlin")
        
        let q5 = Question(tips: "This City has a very famous Soccer team playing in one of Europe's known leagues?" , answer: "Munich", Answer1: "Munich",Answer2: "Malaga",Answer3: "Stuttgart",imageId: "munich")
        
        let q6 = Question(tips: "Until the beginning of the 20th century, it was the largest German-speaking city in the world?" , answer: "Vienna", Answer1: "Vienna",Answer2: "Zurich",Answer3: "Milano",imageId: "vienna")
        
        let q7 = Question(tips: "This country is known for its fashion and beautiful cathedral?" , answer: "Milano", Answer1: "Rome",Answer2: "Napoli",Answer3: "Milano",imageId: "Milano")
        //
        
        
        //Appening the Questions
        questions.append(q1)
        questions.append(q2)
        questions.append(q3)
        questions.append(q4)
        questions.append(q5)
        questions.append(q6)
        questions.append(q7)
        
        
        
    }
    
    
     //Questions for Asia
    func loadAsiaQuestions() {
        
        let a1 = Question(tips: "The City is situated about one degree (137 kilometres or 85 miles) north of the equator?", answer: "Singapore", Answer1: "Hong Kong", Answer2: "Singapore", Answer3: "Dubai",imageId: "Sing")
        
        let a2 = Question(tips: "This City is known for its popular drinking sake?" , answer: "Tokyo", Answer1: "Tokyo ",Answer2: "Hanoi",Answer3: "Bangkok", imageId: "japan")
        
        let a3 = Question(tips: "This City is one of the lagerst City in Asia?" , answer: "Shanghai", Answer1: "Shanghai",Answer2: "Mubai",Answer3: "Tokyo",imageId: "shang")
        
        let a4 = Question(tips: "One Night In...is the Song of the City we are after?" , answer: "Bangkok", Answer1: "Bangkok",Answer2: "Peking",Answer3: "Seoul",imageId: "Bang")
        
        let a5 = Question(tips: "This city was established in the fourth century as Sunda Kelapa, the city became an important trading port for the Sunda Kingdom?" , answer: "Jakarta", Answer1: "Jakarta",Answer2: "HongKong",Answer3: "Taipei",imageId: "jakarta")
        
        let a6 = Question(tips: "This City was a Spanish colony in the early 1900s?" , answer: "Manilla", Answer1: "Manilla",Answer2:"Phnom Penh",Answer3: "New Delhi",imageId: "manila")
        
        let a7 = Question(tips: "This City shares its land borders with China to the north, and Laos and Cambodia to the west.?" , answer: "Hanoi", Answer1: "Manilla",Answer2:"Hanoi",Answer3: "Puhket",imageId: "Han")
        //
        
        
        //...............
        questions.append(a1)
        questions.append(a2)
        questions.append(a3)
        questions.append(a4)
        questions.append(a5)
        questions.append(a6)
        questions.append(a7)

        
        
        
    }
    
    //Questions for Africa
    
    func loadAfricaQuestion(){
        
        let a1 = Question(tips: "This City is calld the blue City of medeideranien ?", answer: "Agadir", Answer1: "Marrache", Answer2: "Tunis", Answer3: "Agadir",imageId: "Agadir2")
        
            
        let a2 = Question(tips: "Founded by Arabs 935, the modern city was an important base for pirates from the 16th century onwards?" , answer: "Alger", Answer1: "Alger",Answer2: "Tripoli",Answer3: "Bamako", imageId: "Alger")
            
        let a3 = Question(tips: "This City the largest city in the Arab world. Its metropolitan area, with a population of over 20 million, is the largest in Africa?" , answer: "Cairo", Answer1: "Cairo",Answer2: "Dakar",Answer3: "Djibouti",imageId: "egypt")
            
        let a4 = Question(tips: " This City is located on the Atlantic Ocean at the mouth of the river Bou Regreg?" , answer: "Rabat", Answer1: "Rabat",Answer2: "Abuja",Answer3: "Lomé",imageId: "Mogadishu")
            
        let a5 = Question(tips: "This City is  Located on the Gulf of Guinea, Lomé is the country's administrative and industrial center, which includes an oil refinery, and its chief port, where it exports coffee, cocoa, copra, and oil palm kernels.?" , answer:"Lomé", Answer1: "Lomé",Answer2: "Luanda",Answer3: "Maseru",imageId: "Lomé")
            
        let a6 = Question(tips: "The city is known for its harbour,and for its natural environment and beutiful moutians range?" , answer: "Cape Town", Answer1: "Nairobi",Answer2: "Cape Town",Answer3: " Freetown",imageId: "Cape")
            //
        let a7 = Question(tips: " This countrys city is located in the Horn of Africa?" , answer: "Djibouti", Answer1: "Djibouti",Answer2: "Tanger",Answer3: "Freetown",imageId: "casa")
            
            //...............
            questions.append(a1)
            questions.append(a2)
            questions.append(a3)
            questions.append(a4)
            questions.append(a5)
            questions.append(a6)
            questions.append(a7)
            
    }
    
    

    
    func loadSouthAmericaQuestions() {
        
        let q1 = Question(tips: "Founded in 1565 by the Portuguese, the city was initially the seat of the Captaincy of this City, a domain of the Portuguese Empire?", answer: "Rio de Janeiro", Answer1: "Rio de Janeiro", Answer2: "Buenos Aires", Answer3: "Santiago",imageId: "RioJan")
    
        
        let q2 = Question(tips: "This beutiful city was founded as the capital of the New Kingdom of Granada on August 6, 1538, by Spanish conquistador Gonzalo Jiménez de Quesada after a harsh expedition into the Andes conquering the Muisca." , answer: "Lima", Answer1: "Bogota",Answer2: "Lima",Answer3: "Santiago", imageId: "Bog")
        
        let q3 = Question(tips: "This City is a cosmopolitan, melting pot city, home to the largest Arab, Italian, Japanese, and Portuguese diasporas, with examples including ethnic neighborhoods of Mercado, Bixiga, and Liberdade respectively?" , answer: "São Paulo", Answer1: "Quito",Answer2: "Montevideo",Answer3: "São Paulo",imageId: "Sao")
        
        let q4 = Question(tips: "In the early 16th century, the Spanish Empire conquered the territory, incorporating it into the Viceroyalty of New Spain ruled from Mexico City?" , answer: "El Salvador", Answer1: "Caracas",Answer2: "El Salvador",Answer3: "La Paz",imageId: "Salv")
        
        let q5 = Question(tips: "Founded in 1736 by order of Cabildo de León, the population of.... rose during the 18th century through the use of colonial planning ?" , answer: "San José", Answer1: "Liberia",Answer2: "San José",Answer3: "Monteverde",imageId: "San10")
        
        let q6 = Question(tips: "Before the arrival of the Spaniards, the region was inhabited by indigenous tribes, mostly speakers of Cariban languages?" , answer: "Cali", Answer1: "Medellin",Answer2: "Cusco",Answer3: "Cali",imageId: "Cali")
        
        let q7 = Question(tips: "In 1826, the city was named the capital of the Department of Antioquia by the National Congress of the nascent Republic of Gran Colombia, comprised by present-day Colombia, Venezuela, Ecuador, and Panama?" , answer: "Medellin", Answer1: "Medellin",Answer2: "Fortaleza",Answer3: "Mexio City",imageId: "Me")
        //
        //Test comment
        
        //Appening the Questions
        questions.append(q1)
        questions.append(q2)
        questions.append(q3)
        questions.append(q4)
        questions.append(q5)
        questions.append(q6)
        questions.append(q7)
    
    
    
}
    
    func design(){
        euoropa.layer.cornerRadius = 10
        Afrika.layer.cornerRadius = 10
        Asia.layer.cornerRadius = 10
        SouthAmerica.layer.cornerRadius = 10
        euoropa.layer.borderWidth = 1
        Afrika.layer.borderWidth = 1
        Asia.layer.borderWidth = 1
        SouthAmerica.layer.borderWidth = 1
    
    }


}

