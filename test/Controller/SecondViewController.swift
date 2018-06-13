//
//  SecondViewController.swift
//  test
//
//  Created by liroy yarimi on 13.6.2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

protocol ChangeColor {
    func changeBackgroundColor(color : UIColor)
}

class SecondViewController: UIViewController {
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var passwordMessage: UILabel!
    
    var changeColorDelegate : ChangeColor?
    var getMessage : String = ""
    var getPass : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = getMessage
        passwordMessage.text = getPass
    }
    
    @IBAction func colorButton(_ sender: AnyObject) {
        if sender.tag == 1{
            changeColorDelegate?.changeBackgroundColor(color: UIColor.red)
        }
        else if sender.tag == 2{
            changeColorDelegate?.changeBackgroundColor(color: UIColor.blue)
        }
        self.dismiss(animated: true, completion: nil)
    }
    


}
