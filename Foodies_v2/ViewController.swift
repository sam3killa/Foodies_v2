//
//  ViewController.swift
//  Foodies_v2
//
//  Created by Wei Chen on 2/22/15.
//  Copyright (c) 2015 Wei Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.enabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkPassword (){
        if (self.passwordField.text == "000000"){
            performSegueWithIdentifier("loginSegue", sender: self)
        }
        else {
            var alertView = UIAlertView(title: "Login Failed", message: "Invalid Email/Password", delegate: self, cancelButtonTitle: "ok")
            alertView.show()
            self.loginButton.enabled = false
        }
        self.loadingView.stopAnimating()
    }

    @IBAction func didEnterEmail(sender: AnyObject) {
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    }

    @IBAction func didEnterPassword(sender: AnyObject) {
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    }

    


    
    @IBAction func didPressLoginButton(sender: AnyObject) {
        loadingView.startAnimating()
        
        self.loginButton.selected = true
        delay(2, {() -> () in
            self.checkPassword()
            self.loginButton.selected = false
        })

    }
    
    

}

