//
//  ViewController.swift
//  CustomEmailLogin
//
//  Created by Nidhi Palan on 5/6/17.
//  Copyright © 2017 Nidhi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func signInSelecterChanged(_ sender: UISegmentedControl) {
        
        isSignIn = !isSignIn
        if isSignIn{
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else{
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }

    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        //validation on email id and password
        if let email = emailTextField.text, let pass = passwordTextField.text{
            if isSignIn{
                FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                    
                    }
                })
            }
            else{
                FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error ) in
                    if let u = user{
                         self.performSegue(withIdentifier: "goToHome", sender: self) 
                    }
                    else{
                        
                    }
                    
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

