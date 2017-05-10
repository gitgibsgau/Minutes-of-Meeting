//
//  LoginViewController.swift
//  MoM
//
//  Created by Gaurav Shinde on 4/24/17.
//  Copyright © 2017 gsmaster. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userLogin(_ sender: Any) {
        
        let uEmail = userEmail.text;
        let uPassword = userPassword.text;
        
        let uEmailStored = UserDefaults.standard.string(forKey: "uEmail");
        let uPasswordStored = UserDefaults.standard.string(forKey: "uPassword");
    
        if(uEmailStored == uEmail){
            
            if(uPasswordStored == uPassword){
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                UserDefaults.standard.synchronize();
                //self.dismiss(animated: true, completion: nil);
                self.performSegue(withIdentifier: "loginView", sender: self);
            }
        }
    
    }

}
