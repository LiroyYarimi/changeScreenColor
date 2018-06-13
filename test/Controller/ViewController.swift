//
//  ViewController.swift
//  test
//
//  Created by liroy yarimi on 13.6.2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,ChangeColor{

    
    @IBOutlet var welcomLabel: UILabel!
    @IBOutlet var userNameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func goButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToSecondScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToSecondScreen" {
            let destinationVC = segue.destination as! SecondViewController
            
            if let name = userNameLabel.text{
                destinationVC.getMessage = name
            }
            
            if let pass = passwordLabel.text{
                if passwordIsStrong(pass: pass){
                    destinationVC.getPass = "Password is strong"
                }else{
                    destinationVC.getPass = "Password is week"
                }
            }
            destinationVC.changeColorDelegate = self
        }
    }
    

    func changeBackgroundColor(color : UIColor) {
        view.backgroundColor = color
        if color == UIColor.blue{
            welcomLabel.textColor = UIColor.white
        }
    }
    
    func passwordIsStrong(pass : String) -> Bool{

        var bigLetter = false
        var smallLetter = false
        var number = false
        var i = pass.startIndex
        
        while i != pass.endIndex {
            let char = pass[i]
            if char >= "a" && char <= "z"{
                smallLetter = true
            }
            else if char >= "A" && char <= "Z"{
                bigLetter = true
            }
            else if char >= "0" && char <= "9"{
                number = true
            }
            
            i = pass.index(after: i)
        }
        if bigLetter && smallLetter && number {
            return true
        }else{
            return false
        }
    }
    
}

