//
//  NorthAmericaViewController.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-29.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//

import UIKit

class NorthAmericaViewController: UIViewController {
    
    var contName : String?
    
    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTest.text = contName
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
