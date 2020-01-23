//
//  ResultViewController.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-23.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var resultText : String?
    
    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelResult.text = resultText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
