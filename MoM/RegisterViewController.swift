//
//  RegisterViewController.swift
//  MoM
//
//  Created by Gaurav Shinde on 4/24/17.
//  Copyright © 2017 gsmaster. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUSer(_ sender: Any) {
        
        let uEmail = userEmail.text;
        let uPassword = userPassword.text;
        let uConfirmPassword = userConfirmPassword.text;
        
        //check for empty fields
        
        if((uEmail?.isEmpty)! || (uPassword?.isEmpty)! || (uConfirmPassword?.isEmpty)!){
            
            displayAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        if(uPassword != uConfirmPassword){
            
            displayAlertMessage(userMessage: "Passwords do not match!!");
            return;
        }
        
        //store data
        
        UserDefaults.standard.set(uEmail, forKey: "uEmail");
        UserDefaults.standard.set(uPassword, forKey: "uPassword");
        UserDefaults.standard.synchronize();
        
        
        //display alert message with confirmation
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. Thank you!!", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    func displayAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil)
    }

    

}
